import 'package:astrotak/bloc/astrotakQuestions_bloc.dart';
import 'package:astrotak/model/Question.dart';
import 'package:astrotak/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AskQuestion extends StatefulWidget {
  AskQuestion(this.category, this.questions);
  List<String> category;
  List<Question> questions;
  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  // String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  // var items = [
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4',
  //   'Item 5',
  // ];

  Widget questionsList(String question) {
    return ListTile(
        minLeadingWidth: 5,
        contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
        dense: true,
        // visualDensity: VisualDensity(horizontal: -2, vertical: -4),
        horizontalTitleGap: 5,
        leading: Image(
          image: AssetImage('assets/questions.png'),
          height: 30,
          fit: BoxFit.contain,
        ),
        title: Text(
          question,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }

  String dropdownvalue = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownvalue = widget.category[0];
  }

  List<String> suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          padding: const EdgeInsets.only(top: 30.0),
          margin: const EdgeInsets.only(top: 25, bottom: 60),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          "Ask a Question",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),

                      //another option is to test listview

                      //       Container(..),
                      //       SizedBox(..),
                      //       Container(...),
                      //       Text(..)
                      //     ],
                      // ),

                      Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "Chose Category",
                            style: Theme.of(context).textTheme.headline1,
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: DropdownButton(
                            isExpanded: true,
                            elevation: 5,
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: widget.category.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                widget.questions.forEach((e) => {
                                      if (e.name == dropdownvalue)
                                        {suggestions = e.suggestions ?? []}
                                    });
                              });
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLength: 150,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Type a question here',
                            ),
                          )),
                      // Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 12),
                      //     child: Align(
                      //         alignment: Alignment.bottomRight,
                      //         child: Text(
                      //           "0/150",
                      //           style: Theme.of(context).textTheme.bodyText1,
                      //         ))),
                      Text(
                        "Ideas what to Ask (Select Any)",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      ListView.separated(
                        shrinkWrap: true,

                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          );
                        },
                        // padding: EdgeInsets.symmetric(horizontal: 5),
                        itemBuilder: ((context, index) {
                          return questionsList(suggestions[index]);
                          // Container(child: Text(_.todoList[index].title));
                        }),
                        itemCount: suggestions.length,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          "Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
                        color: Color(0xfffff1e8),
                        child: Text(
                          "• Personalized responses provided by our team of Vedic astrologers within 24 hours.\n • Qualified and experienced astrologers will look into your birth chart and provide the right guidance.\n • You can seek answers to any part of your life and for most pressing issues.\n • Our team of Vedic astrologers will not just provide answers but also suggest a remedial solution.\n ",
                          style: TextStyle(color: Color(0xffff944d)),
                        ),
                      ),
                    ],
                  )))),
      Container(
          height: 50,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          color: Color(0xff4B60BC),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Wallet Balance : ₹ 0",
                    style: (Theme.of(context).textTheme.headline2),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () =>
                          {Fluttertoast.showToast(msg: "Comming Soon")},
                      child: Text(
                        "Add Money",
                        style: TextStyle(
                            color: Color(0xff4B60BC),
                            fontWeight: FontWeight.bold),
                      )))
            ],
          )),
      Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
              height: 50,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              color: Color(0xff4B60BC),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "₹ 150 ( 1 Question on Love)",
                        style: (Theme.of(context).textTheme.bodyText2),
                      )),
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () =>
                              {Fluttertoast.showToast(msg: "Comming Soon")},
                          child: Text(
                            "Ask Now",
                            style: TextStyle(
                                color: Color(0xff4B60BC),
                                fontWeight: FontWeight.w400),
                          )))
                ],
              ))),
    ]);

    // ]);
  }
}
