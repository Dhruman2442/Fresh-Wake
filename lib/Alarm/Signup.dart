import 'package:flutter/material.dart';
import 'package:fresh_wake/Alarm/Home-page.dart';
import 'package:fresh_wake/Alarm/Login.dart';
import 'package:fresh_wake/Widgets.dart';

bool _isObscure = false;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Space(80),
                  ImageWidget("asset/Freshwakelogo.png", 112, 79, () {}),
                  Space(50),
                  TextStyle1("Sign Up", 31, Color(0xFFE7E3E3), FontWeight.w700,
                      TextAlign.center, FontStyle.normal),
                  Space(30),
                  TextStyle1(
                      "Please Sign up to continue",
                      20,
                      Color(0xFFE7E3E3),
                      FontWeight.w500,
                      TextAlign.center,
                      FontStyle.normal),
                  Space(60),
                  Textfield1(
                      EmailController,
                      "Email",
                      "Enter your email",
                      18,
                      Color(0xFFE7E3E3),
                      FontWeight.w500,
                      TextAlign.center,
                      FontStyle.normal,
                      "asset/Email.png"),
                  Space(20),
                  TextfieldPassword(
                      passwordController,
                      "Password",
                      "Enter your password",
                      18,
                      Color(0xFFE7E3E3),
                      FontWeight.w500,
                      TextAlign.center,
                      FontStyle.normal,
                      "asset/Key.png", () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }, !_isObscure),
                  Space(45),
                  Button1("Signup", 18, Color(0xFF6265C3), FontWeight.w500,
                      TextAlign.center, FontStyle.normal, () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (contex) => HomePage()));
                  }, context),
                  Space(20),
                  TextStyle1("Or", 20, Color(0xFFE7E3E3), FontWeight.w600,
                      TextAlign.center, FontStyle.normal),
                  Space(20),
                  Stack(
                    children: [
                      Button1(
                          "Signup with Google",
                          18,
                          Color(0xFF383838),
                          FontWeight.w500,
                          TextAlign.center,
                          FontStyle.normal,
                          () {},
                          context),
                      // Container(,
                      //   child: Image.asset("asset/Google.png"),
                      //         )
                    ],
                  ),
                  Space(7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextStyle1(
                          "Already have an account?",
                          14,
                          Color(0xFFE7E3E3),
                          FontWeight.w300,
                          TextAlign.center,
                          FontStyle.normal),
                      TextButton1(
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        "Login",
                        14,
                        Color(0xFF6265C3),
                        FontWeight.w500,
                        TextAlign.start,
                        FontStyle.normal,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
