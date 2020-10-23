import 'package:flutter/material.dart';
import 'package:twitter/constants.dart';
import 'package:twitter/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter',
      theme: ThemeData(
        appBarTheme: AppBarTheme.of(context).copyWith(color: kPrimaryBackgroundColor),
        backgroundColor: kSoftPrimaryBackgroundColor,
        brightness: Brightness.light,
        fontFamily: 'Lato',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: kTextPrimaryColor),
          subtitle1: TextStyle(fontSize: 16, color: kTextSecondaryColor),
          headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: kTextPrimaryColor),
          bodyText1: TextStyle(fontSize: fontSize, color: kTextPrimaryColor),
        ),
        buttonColor: kPrimaryColor,
        primaryColor: kTextPrimaryColor,
        primaryColorLight: kWhiteColor,
        primaryColorDark: kPrimaryColor,
      ),
      home: HomeScreen(title: 'Twitter'),
    );
  }
}
