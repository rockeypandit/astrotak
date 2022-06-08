import 'package:astrotak/appRepository/appRepository.dart';
import 'package:astrotak/bloc/relativemanagement_bloc.dart';
import 'package:astrotak/styles/styles.dart';
import 'package:astrotak/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewProfileForm extends StatefulWidget {
  const AddNewProfileForm({Key? key}) : super(key: key);

  @override
  State<AddNewProfileForm> createState() => _AddNewProfileFormState();

  static _AddNewProfileFormState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AddNewProfileFormState>();
}

class _AddNewProfileFormState extends State<AddNewProfileForm> {
  final _formKey = GlobalKey<FormState>();
  bool am = true;
  _selectAmPm(value) {
    setState(() {
      am = value;
    });
  }

  String? meridiem, placeName, placeId, firstName, lastName = "", gender;
  int? dobDay, dobMonth, dobYear, tobHour, tobMin, relationId;

  Map location = {};

  setLocation(String id, String name) {
    setState(() => {location["id"] = id, location["name"] = name});
  }

  setGender(value) {
    setState(() {
      gender = value;
    });
  }

  setRelation(value) {}

  _vaidateAndSave() {
    _formKey.currentState?.validate();
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    _formKey.currentState?.save();
    AppRepository().addRelativce({
      "birthDetails": {
        "dobDay": dobDay,
        "dobMonth": dobMonth,
        "dobYear": dobYear,
        "tobHour": tobHour,
        "tobMin": tobMin,
        "meridiem": am ? "AM" : "PM"
      },
      "birthPlace": {"placeName": location['name'], "placeId": location['id']},
      "firstName": firstName,
      "lastName": lastName,
      "relationId": 3,
      "gender": gender
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.all(1),
              child: Text(
                "Name",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          TextFormField(
            onSaved: (String? value) {
              firstName = value;
            },
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter valid Name';
              }
              return null;
            },
          ),
          Container(
              margin: EdgeInsets.all(1),
              child: Text(
                "Date of Birth",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          // Container(
          // height: 50,
          // width: MediaQuery.of(context).size.width,
          // child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        onSaved: (String? value) {
                          dobDay = int.parse(value!);
                        },
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "DD"),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.parse(value) > 31 ||
                              int.parse(value) < 1) {
                            return 'Invalid DD';
                          }
                          return null;
                        },
                      ))),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        onSaved: (String? value) {
                          dobMonth = int.parse(value!);
                        },
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "MM"),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.parse(value) > 12 ||
                              int.parse(value) < 1) {
                            return 'Invalid MM';
                          }
                          return null;
                        },
                      ))),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(3),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "YYYY"),
                  maxLength: 4,
                  onSaved: (String? value) {
                    dobYear = int.parse(value!);
                  },
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid Year';
                    }
                    return null;
                  },
                ),
              ))
            ],
          ),
          Container(
              margin: EdgeInsets.all(1),
              child: Text(
                "Time of Birth",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        onSaved: (String? value) {
                          tobHour = int.parse(value!);
                        },
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "HH"),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.parse(value) > 24 ||
                              int.parse(value) < 0) {
                            return 'Invalid HH';
                          }
                          return null;
                        },
                      ))),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(3),
                      child: TextFormField(
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        onSaved: (String? value) {
                          tobMin = int.parse(value!);
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "MM"),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.parse(value) > 60 ||
                              int.parse(value) < 0) {
                            return 'Invalid MM';
                          }
                          return null;
                        },
                      ))),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                _selectAmPm(true);
                              },
                              child: Card(
                                margin: EdgeInsets.all(0),
                                color: am ? secondaryColor : Colors.white,
                                child: Container(
                                    color: am ? secondaryColor : Colors.white,
                                    margin: EdgeInsets.all(10),
                                    child: Text("AM",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: am
                                                ? Colors.white
                                                : Colors.black))),
                              )),
                          GestureDetector(
                            onTap: () {
                              _selectAmPm(false);
                            },
                            child: Card(
                              margin: EdgeInsets.all(0),
                              color: !am ? secondaryColor : Colors.white,
                              child: Container(
                                  color: !am ? secondaryColor : Colors.white,
                                  margin: EdgeInsets.all(10),
                                  child: Text("PM",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: am
                                              ? Colors.black
                                              : Colors.white))),
                            ),
                          )
                        ])),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.all(1),
              child: Text(
                "Place of Birth",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          LocationTextBox(callback: setLocation),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(1),
                              child: Text(
                                "Gender",
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                          DropdownButtonFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null) {
                                return 'Invalid Gender';
                              }
                              return null;
                            },
                            items: ["MALE", "FEMALE"].map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                setGender(newValue);
                              });
                            },
                          ),
                        ])),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(3),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(1),
                              child: Text(
                                "Relation",
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                          DropdownButtonFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null) {
                                return 'Invalid Relation';
                              }
                              return null;
                            },
                            items: ["MOTHER", "FATHER", "SISTER", "BROTHER"]
                                .map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                setRelation(newValue);
                              });
                            },
                          ),
                        ])),
              )
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: _vaidateAndSave,
              child: Text("Save Changes"),
            ),
          )
        ]));
  }
}
