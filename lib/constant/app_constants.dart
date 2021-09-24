import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaticVariables {
  static const String appTitle = "Ortalama Hesaplama";
  static const MaterialColor themeColor = Colors.indigo;
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: themeColor);

  static const BorderRadius staticBorder = BorderRadius.all(
    Radius.circular(20),
  );
  static final TextStyle dersSayiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: themeColor);
  static final TextStyle ortalamaSyiStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w600, color: themeColor);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: themeColor);

  static EdgeInsets yatayPadding = EdgeInsets.symmetric(horizontal: 8);
}
