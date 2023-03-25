import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_wake/theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

final alarmTaskController = TextEditingController();
final passwordController = TextEditingController();
final nameController = TextEditingController();

final userdata = GetStorage();

List<double> WeekDaysCount = [54, 100, 20, 50, 60, 99, 70];
List<String> WeekDays = ["M", "T", "W", "T", "F", "S", "S"];

List<String> SettingList = [
  "Account Details",
  "Settings",
  "Help and Support",
  "Logout",
];
List<Image> SettingImageList = [
  Image.asset("asset/Profile-person.png"),
  Image.asset("asset/Settings.png"),
  Image.asset("asset/Help.png"),
  Image.asset("asset/Logout.png"),
];

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

Widget ImageWidget(
    String imagePath, double width, double height, VoidCallback call) {
  return GestureDetector(
    onTap: call,
    child: Image.asset(
      imagePath,
      width: width,
      height: height,
    ),
  );
}

Widget Textfield1(
    TextEditingController controller,
    String ltext,
    String htext,
    double fontSize,
    Color color,
    FontWeight fontWeight,
    TextAlign textAlign,
    FontStyle fontStyle,
    String image) {
  return TextField(
    controller: controller,
    style: TextStyle(color: color, fontSize: fontSize),
    decoration: InputDecoration(
        fillColor: Color_Darkergrey,
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
    TextEditingController controller,
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
    controller: controller,
    style: TextStyle(color: Color_White, fontSize: fontSize),
    obscureText: obscureText,
    decoration: InputDecoration(
      fillColor: Color_Darkergrey,
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

Widget TextfieldAlarmSet(
    BuildContext context,
    Color color,
    TextEditingController controller,
    VoidCallback onclick,
    ) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: color),
    width: MediaQuery.of(context).size.width / 8,
    margin: const EdgeInsets.all(10),
    child: TextField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(2),
      ],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      maxLengthEnforcement: MaxLengthEnforcement.values[1],
      onChanged: (value) {
        onclick();
      },
      controller: controller,
      decoration: const InputDecoration(
        hintText: "SS",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
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
    child: ElevatedButton(
      onPressed: onPressed,
      style:ElevatedButton.styleFrom(backgroundColor: color),
      child:
      TextStyle1(text, size, Color_White, fontWeight, textAlign, fontStyle),
    ),
  );
}