import "package:flutter/material.dart";
import 'package:fresh_wake/Widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: TextStyle1("Profile", 20, const Color(0xFFFFFFFF),
            FontWeight.w600, TextAlign.center, FontStyle.normal),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFFFFFFF),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF520F0F),
                          borderRadius: BorderRadius.circular(50)),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  ImageWidget("asset/Profile.png", 100, 100, () {}),
                ],
              )
              // Container(child: ,)
            ],
          ),
        ),
      ),
    );
  }
}
