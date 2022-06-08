import 'package:astrotak/bloc/astrotakQuestions_bloc.dart';
import 'package:astrotak/screens/askQuestion.dart';
import 'package:astrotak/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profilepage()))
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ImageIcon(
                  AssetImage("assets/profile.png"),
                  color: Color(0xFFFF6F00),
                  size: 24,
                )),
          ),
        ],
      ),
      body:
          BlocBuilder<QuestionsBloc, QuestionsState>(builder: (context, state) {
        if (state is QuestionsInprogress)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is QuestionsFailure)
          return Center(
            child: Text("Something went wrong"),
          );
        else if (state is QuestionsSuccess) {
          List<String> cats = [];
          state.astrotak.forEach((q) => {cats.add(q.name ?? "")});
          return AskQuestion(cats, state.astrotak);
        } else {
          return Text("Something went wrong");
        }
      }),
      floatingActionButton: Align(
          alignment: Alignment(1, 0.9),
          child: FloatingActionButton(
            elevation: 8,
            onPressed: () => {},
            child: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/talk.png"),
              color: Colors.grey,
              size: 20,
            ),
            label: 'Talk',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/ask.png"),
              // color: Colors.grey,
              size: 20,
            ),
            label: 'Ask Question',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/reports.png"),
              color: Colors.grey,
              size: 20,
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/chat.png"),
              color: Colors.grey,
              size: 20,
            ),
            label: 'Chat',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.orange,
        onTap: (index) => {
          if (index != 2)
            {
              Fluttertoast.showToast(
                  msg: "Comming Soon",
                  toastLength: Toast.LENGTH_SHORT,
                  fontSize: 16.0)
            }
        },
        selectedLabelStyle: TextStyle(fontSize: 12),
      ),
    );
  }
}
