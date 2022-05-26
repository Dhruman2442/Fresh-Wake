import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget TextStyle1(String text, double fontSize, Color color,
    FontWeight fontWeight, TextAlign textAlign, FontStyle fontStyle) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle),
  );
}

Widget Space(double height) {
  return SizedBox(
    height: height,
  );
}
Widget ImageWidget(String imagePath, double width, double height) {
  return Image.asset(
    imagePath,
    width: width,
    height: height,
  );
}