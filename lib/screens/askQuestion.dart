import 'package:astrotak/styles/styles.dart';
import 'package:flutter/material.dart';

class AskQuestion extends StatefulWidget {
  const AskQuestion({Key? key}) : super(key: key);

  @override
  State<AskQuestion> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  Widget questionsList(String question) {
    return ListTile(
        leading: Image(image: AssetImage('assets/questions.png')),
        title: Text(question));
  }

  final questions = ['1', '2'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ask a Question",
          style: TextHeading,
        ),
        Text(
            "Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.",
            style: TextDescription),

        //another option is to test listview
        // ListView(
        //     children: [
        //       Container(..),
        //       SizedBox(..),
        //       Container(...),
        //       Text(..)
        //     ],
        // ),
        SingleChildScrollView(
          child: Column(
            children: [
              Text("Chose Category", style: TextHeading),
              DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "0/150",
                    style: TextStyle(),
                  )),
              Text("Ideas what to Ask (Select Any)", style: TextHeading),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                padding: EdgeInsets.all(5),
                itemBuilder: ((context, index) {
                  return questionsList(questions[index]);
                  // Container(child: Text(_.todoList[index].title));
                }),
                itemCount: questions.length,
              ),
              Text(
                  "Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you."),
              Container(
                child: Text(
                    "• Personalized responses provided by our team of Vedic astrologers within 24 hours.\n • Qualified and experienced astrologers will look into your birth chart and provide the right guidance.\n • You can seek answers to any part of your life and for most pressing issues.\n • Our team of Vedic astrologers will not just provide answers but also suggest a remedial solution.\n "),
              ),
            ],
          ),
        )
      ],
    );
  }
}
