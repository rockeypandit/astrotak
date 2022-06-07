import 'package:flutter/material.dart';

class BasicProfile extends StatefulWidget {
  const BasicProfile({Key? key}) : super(key: key);

  @override
  State<BasicProfile> createState() => BbasicProfileState();
}

class BbasicProfileState extends State<BasicProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Coming Soon",
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
