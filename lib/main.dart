import "package:flutter/material.dart";
import 'package:fresh_wake/Alarm/Home-page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(FreshWake());

class FreshWake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        gradientBackground:
            const LinearGradient(colors: [Colors.black, Colors.black]),
        image: Image.asset(
          "asset/Clock.png",
        ),
        photoSize: 146.0,
        seconds: 3,
        navigateAfterSeconds: HomePage(),
        loadingText: Text("Fresh Wake",
            style: GoogleFonts.baloo2(color: Colors.white, fontSize: 50,fontWeight: FontWeight.bold)),
        loaderColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
    );
  }
}
