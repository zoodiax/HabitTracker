import 'package:flutter/material.dart';
import 'goal_overview.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        focusColor: Color(0xFFFC6A03),
        textTheme: TextTheme(
          headline1: GoogleFonts.spartan(
              textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800])),
          headline2: GoogleFonts.spartan(
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
          headline3: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey[800],
            ),
          ),
          bodyText1: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 15,
            ),
          ),
          bodyText2: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFFC6A03),
        ),
      ),
      home: GoalOverview(),
    );
  }
}
