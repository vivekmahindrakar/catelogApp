import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black)),
      );

  static Color cream = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff403b58);
}
