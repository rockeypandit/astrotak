import 'package:astrotak/screens/basicProfile.dart';
import 'package:astrotak/screens/fandfProfile.dart';
import 'package:astrotak/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool profileTab = true;
  toggleProfileTab(tab) {
    print(tab);
    print(profileTab);
    setState(() {
      if (tab == 1) {
        profileTab = false;
      } else {
        profileTab = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
              elevation: 0,
              leading: ImageIcon(
                AssetImage("assets/hamburger.png"),
                color: Color(0xFFFF6F00),
                size: 20,
              ),
              centerTitle: true,
              title: Image(
                image: AssetImage("assets/icon.png"),
                fit: BoxFit.cover,
                height: 45,
              ),
              bottom: TabBar(
                indicatorColor: primaryColor,
                labelStyle:
                    Theme.of(context).textTheme.bodyText2, //For Selected tab
                unselectedLabelStyle: Theme.of(context).textTheme.bodyText1,
                labelColor: primaryColor,
                unselectedLabelColor: Colors.black,
                tabs: [Tab(text: "My Profile"), Tab(text: "Order History")],
              )),
          body: TabBarView(children: [
            SingleChildScrollView(
                child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Container(
                                height: 45,
                                child: TextButton(
                                  child: Text("Basic Profile",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: !profileTab
                                              ? Colors.black
                                              : Colors.white)),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    backgroundColor: profileTab
                                        ? MaterialStateProperty.all(
                                            primaryColor)
                                        : MaterialStateProperty.all(
                                            Colors.white),
                                  ),
                                  onPressed: () => toggleProfileTab(0),
                                ))),
                        Expanded(
                            child: Container(
                                height: 45,
                                child: TextButton(
                                    onPressed: () => toggleProfileTab(1),
                                    child: Text("Friends and Family Profile",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: profileTab
                                                ? Colors.black
                                                : Colors.white)),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                        backgroundColor: !profileTab
                                            ? MaterialStateProperty.all(
                                                primaryColor)
                                            : MaterialStateProperty.all(
                                                Colors.white)))))
                      ],
                    )),
                profileTab
                    ? const BasicProfile()
                    : const FriendsAndFamilyProfile()
              ],
            )),
            Center(
                child: Text(
              "No orders yet",
              style: Theme.of(context).textTheme.bodyText1,
            )),
          ])),
    );
  }
}
