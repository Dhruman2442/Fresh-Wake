import "package:flutter/material.dart";
import 'package:fresh_wake/Widgets.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white30,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFFFFFFFF),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  TextStyle1(
                    "Profile",
                    20,
                    const Color(0xFFFFFFFF),
                    FontWeight.w600,
                    TextAlign.center,
                    FontStyle.normal,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.width * 0.85,
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        ImageWidget("asset/Profile.png", 93, 93, () {}),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            children: [],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
