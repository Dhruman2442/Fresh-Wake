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
    color: Colors.white,
    imagePath,
    width: width,
    height: height,
  );
}

Widget Textfield1(
    String ltext,
    String htext,
    double fontSize,
    Color color,
    FontWeight fontWeight,
    TextAlign textAlign,
    FontStyle fontStyle,
    String image) {
  return TextField(
    style: TextStyle(color: color, fontSize: fontSize),
    decoration: InputDecoration(
        fillColor: const Color(0xBF484848),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            image,
            width: 24,
            height: 24,
            fit: BoxFit.fill,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelText: ltext,
        labelStyle: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            fontStyle: fontStyle),
        hintStyle: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            fontStyle: fontStyle),
        hintText: htext),
  );
}

Widget TextfieldPassword(
    String ltext,
    String htext,
    double fontSize,
    Color color,
    FontWeight fontWeight,
    TextAlign textAlign,
    FontStyle fontStyle,
    String image,
    VoidCallback onclick,
    bool obscureText) {
  return TextField(
    style: TextStyle(color: Colors.white, fontSize: fontSize),
    obscureText: obscureText,
    decoration: InputDecoration(
      fillColor: const Color(0xBF484848),
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      labelText: ltext,
      hintText: htext,
      labelStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle),
      hintStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          image,
          width: 24,
          height: 24,
          fit: BoxFit.fill,
        ),
      ),
      suffixIconColor: color,
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: color,
        ),
        onPressed: onclick,
      ),
    ),
  );
}

Widget TextButton1(
    VoidCallback onpressed,
    String text,
    double fontSize,
    Color color,
    FontWeight fontWeight,
    TextAlign textAlign,
    FontStyle fontStyle) {
  return TextButton(
    onPressed: onpressed,
    child: TextStyle1(text, fontSize, color, fontWeight, textAlign, fontStyle),
  );
}

Widget Button1(
    String text,
    double size,
    Color color,
    FontWeight fontWeight,
    TextAlign textAlign,
    FontStyle fontStyle,
    VoidCallback onPressed,
    BuildContext context) {
  return Container(
    clipBehavior: Clip.antiAlias,
    decoration:
        const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
    height: 50,
    width: MediaQuery.of(context).size.width * 0.95,
    child: RaisedButton(
      onPressed: onPressed,
      color: color,
      child: TextStyle1(
          text, size, Colors.white, fontWeight, textAlign, fontStyle),
    ),
  );
}

Widget AlarmCard(Color color) {
  return Card(
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: ImageWidget("asset/Alarm Bell.png", 100, 100),
        ),
        Column(
          children: [
            Text("Alarm"),
            Text("Set Alarm"),
          ],
        ),
      ],
    ),
  );
}
