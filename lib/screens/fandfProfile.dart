import 'package:astrotak/screens/addnewProfileForm.dart';
import 'package:astrotak/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FriendsAndFamilyProfile extends StatefulWidget {
  const FriendsAndFamilyProfile({Key? key}) : super(key: key);

  @override
  State<FriendsAndFamilyProfile> createState() =>
      _FriendsAndFamilyProfileState();
}

class _FriendsAndFamilyProfileState extends State<FriendsAndFamilyProfile> {
  var data = [
    {
      "name": "Mohit",
      "dob": "11-8-1994",
      "tob": "12:20",
      "rel": "Mother in law"
    }
  ];
  bool addNewProfile = false;
  toggleAddNewProfile(value) {
    setState(() {
      addNewProfile = value;
    });
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        contentPadding: EdgeInsets.all(25),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text("Do you really want to Delete?")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("YES")))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("NO"))))
              ],
            )
          ],
        ));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget rowGenerator(name, dob, tob, rel) {
    return Container(
        height: 80,
        child: Card(
          margin: EdgeInsets.all(1),
          elevation: 5,
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.14,
                      child: Text(
                        name,
                        style: TextStyle(color: Colors.black),
                      )),
                  Container(
                      margin: EdgeInsets.all(1),
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        dob,
                        style: TextStyle(color: Colors.black),
                      )),
                  Container(
                      margin: EdgeInsets.all(1),
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Text(
                        tob,
                        style: TextStyle(color: Colors.black),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        rel,
                        style: TextStyle(color: Colors.black),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: Icon(
                        Icons.edit,
                        color: primaryColor,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: GestureDetector(
                        onTap: () => {showAlertDialog(context)},
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ))
                ],
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: !addNewProfile
          ? Column(
              children: [
                Container(
                    height: 50,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    color: Color(0xffE0E3F1),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Color(0xff4B60BC),
                          ),
                        ),
                        Text(
                          "  Wallet Balance : ₹ 0  ",
                          style: (TextStyle(color: secondaryColor)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side:
                                              BorderSide(color: Colors.black)),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () => {
                                      Fluttertoast.showToast(
                                          msg: "Comming Soon")
                                    },
                                child: Text(
                                  "Add Money",
                                  style: TextStyle(
                                      color: Color(0xff4B60BC),
                                      fontWeight: FontWeight.bold),
                                )))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.14,
                            child: Text(
                              "Name",
                              style: TextStyle(color: secondaryColor),
                            )),
                        Container(
                            margin: EdgeInsets.all(1),
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              "DOB",
                              style: TextStyle(color: secondaryColor),
                            )),
                        Container(
                            margin: EdgeInsets.all(1),
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(
                              "TOB",
                              style: TextStyle(color: secondaryColor),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text(
                              "Relation",
                              style: TextStyle(color: secondaryColor),
                            )),
                      ],
                    )),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return rowGenerator(data[i]["name"], data[i]["dob"],
                          data[i]["tob"], data[i]["rel"]);
                    }),
                Center(
                  child: ElevatedButton(
                    onPressed: () => {toggleAddNewProfile(true)},
                    child: Text("+ Add New Profile"),
                  ),
                )
              ],
            )
          : Column(
              children: [
                Container(
                  height: 80,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_sharp),
                        onPressed: () => {toggleAddNewProfile(false)},
                      ),
                      Text(
                        "     Add New Profile",
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
                AddNewProfileForm()
              ],
            ),
    );
  }
}
