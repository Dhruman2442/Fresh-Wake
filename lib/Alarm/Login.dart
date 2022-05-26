import 'package:flutter/material.dart';
import 'package:fresh_wake/Widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [ImageWidget("asset/Freshakelogo.svg", 100, 100)],
            ),
          ),
        ),
      ),
    );
  }
}
