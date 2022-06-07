import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppTheme {
  AppTheme._();

  // static Color lightBlue = HexColor('#76e0ff');
  // static Color red = HexColor('#f54752');
  // static Color green = HexColor('#76ff7f');
  // static Color purple = HexColor('#7057d2');
  // static Color blue = HexColor('#0d76b5');
  static Color scaffoldColor = HexColor('#ffffff');
  static Color primaryColor = HexColor('#ff6f00');
  static Color secondaryColor = HexColor('#4B60BC');

  static Color appbarcolor = HexColor('#ffffff');
  // static Color textHeadLine = HexColor('#2c3242');
  // static Color headline2 = HexColor('#a5a5a5');
  // static Color headLine4 = HexColor('#aa2c3242');

  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: scaffoldColor,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: primaryColor),
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
      ),
      appBarTheme: AppBarTheme(color: appbarcolor),
      textTheme: TextTheme(
        headline1: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
          fontFamily: 'Poppins',
        ),
        headline2: const TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        // headline3: const TextStyle(
        //   color: Colors.black,
        //   fontFamily: 'Poppins',
        //   fontWeight: FontWeight.bold,
        //   fontSize: 15,
        // ),
        // headline4: TextStyle(
        //   color: headLine4,
        //   fontFamily: 'Poppins',
        //   fontWeight: FontWeight.bold,
        //   fontSize: 16,
        // ),
        bodyText1: TextStyle(
          // color: Colors.black,
          color: Colors.grey[800],
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        bodyText2: TextStyle(
          // color: Colors.black,
          color: Colors.white,
          fontFamily: 'Poppins',
          fontStyle: FontStyle.normal,
          fontSize: 12,
        ),
      ),
    );
  }
}
