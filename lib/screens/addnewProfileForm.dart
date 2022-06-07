import 'package:astrotak/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewProfileForm extends StatefulWidget {
  const AddNewProfileForm({Key? key}) : super(key: key);

  @override
  State<AddNewProfileForm> createState() => _AddNewProfileFormState();
}

class _AddNewProfileFormState extends State<AddNewProfileForm> {
  final _formKey = GlobalKey<FormState>();
  bool am = true;
  _selectAmPm(value) {
    setState(() {
      am = value;
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
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "DD"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "MM"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
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
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "HH"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "MM"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a city';
              }
              return null;
            },
          ),
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
                          TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          )
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
                          TextFormField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          )
                        ])),
              )
            ],
          ),
        ]));
  }
}
