import 'package:astrotak/bloc/astrotakQuestions_bloc.dart';
import 'package:astrotak/bloc/relativemanagement_bloc.dart';
import 'package:astrotak/screens/bottomBar.dart';
import 'package:astrotak/utils/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<QuestionsBloc>(
              create: (BuildContext context) =>
                  QuestionsBloc()..add(QuestionsRequest())),
          BlocProvider<RelativemanagementBloc>(
              create: (BuildContext context) => RelativemanagementBloc())
        ],

        // return BlocProvider(
        // create: (context) => QuestionsBloc()..add(QuestionsRequest()),
        child: MaterialApp(
          title: 'Astro Talk',
          theme: AppTheme.lightTheme(),
          home: BottomBar(),
        ));
  }
}
