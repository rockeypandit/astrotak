import 'package:astrotak/appRepository/appRepository.dart';
import 'package:astrotak/model/Location.dart';
import 'package:astrotak/screens/addnewProfileForm.dart';
import 'package:flutter/material.dart';
import '../screens/addnewProfileForm.dart';

typedef void StringCallback(String id, String name);

class LocationTextBox extends StatefulWidget {
  LocationTextBox({Key? key, this.callback}) : super(key: key);
  final StringCallback? callback;
  @override
  State<LocationTextBox> createState() => _LocationTextBoxState();
}

class _LocationTextBoxState extends State<LocationTextBox> {
  List<String> relativeLocations = [];
  List<Location>? allLocations;
  _getLocation(location) async {
    List<Location> rls = await AppRepository().getAllLocation(location);
    List<String> ls = [];
    rls.forEach((element) {
      ls.add(element.placeName);
    });
    setState(() {
      _textFieldHints = ls;
      allLocations = rls;
    });
  }

  List<String> _textFieldHints = [];
  var _textFieldController;

  // @override
  // void dispose() {
  //   super.dispose();
  //   // _textFieldController.dispose();
  // }

  _addAutoFillText() {
    if (_textFieldController.text.isEmpty) {
      // Don't add input text if TextFormField is empty
      debugPrint('_textFieldController.text is empty');
    } else {
      debugPrint('${_textFieldController.text} added');
      setState(() {
        // Add TextFormField String to List
        _textFieldHints.add(_textFieldController.text);
        // Clear TextFormField after adding
        _textFieldController.clear();
      });
      debugPrint('_textFieldHints contains:');
      _textFieldHints.sort();
      _textFieldHints.forEach((text) {
        debugPrint('$text');
      });
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return TextFormField(
    //   onChanged: _getLocation,
    //   decoration: InputDecoration(border: OutlineInputBorder()),
    //   validator: (value) {
    //     if (value == null || value.isEmpty) {
    //       return 'Please select a city';
    //     }
    //     return null;
    //   },
    // );

    return RawAutocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text == null || textEditingValue.text == '') {
        return const Iterable<String>.empty();
      }
      return _textFieldHints.where((String option) {
        return option
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase());
      });
    }, onSelected: (String selection) {
      String id = '', name = '';
      allLocations?.forEach((element) {
        element.placeName == selection;
        print("Matched");
        id = (element.placeId);
        name = element.placeName;
      });
      // setState(() {
      AddNewProfileForm.of(context)?.setLocation(id, name);
      // MyStatefulWidget.of(context).string = "String from method 2";
      // widget.locationId = element.placeId;
      // });
    }, fieldViewBuilder: (BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
      _textFieldController = textEditingController;
      return TextFormField(
        decoration: InputDecoration(border: OutlineInputBorder()),
        controller: _textFieldController,
        focusNode: focusNode,
        onFieldSubmitted: (String value) {
          onFieldSubmitted();
        },
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 2) {
            return 'Please select a city';
          }
          return null;
        },
        onChanged: _getLocation,
      );
    }, optionsViewBuilder: (BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options) {
      return Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4.0,
          child: Container(
            height: 200.0,
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: options.length,
              itemBuilder: (BuildContext context, int index) {
                final String option = options.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    onSelected(option);
                  },
                  child: ListTile(
                    title: Text(option),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
