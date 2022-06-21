import "package:flutter/material.dart";
import 'package:fresh_wake/Widgets.dart';

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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        padding: const EdgeInsets.only(top: 40),
                        child: Container(
                            padding:
                                const EdgeInsets.only(top: 100, bottom: 20),
                            decoration: const BoxDecoration(
                              color: Color(0xFF222424),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: SettingList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    Column(children: [
                                      ListTile(
                                        leading: SettingImageList[index],
                                        title: TextStyle1(
                                            SettingList[index],
                                            18,
                                            const Color(0xFFE7E3E3),
                                            FontWeight.w600,
                                            TextAlign.left,
                                            FontStyle.normal),
                                      ),
                                      Container(
                                        color: const Color(0xFF6D6D6D),
                                        child: SizedBox(
                                          height: 0.5,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                        ),
                                      )
                                    ]))),
                      ),
                      Column(
                        children: [
                          ImageWidget("asset/Profile.png", 150, 100, () {}),
                          Space(1),
                          Container(
                            child: TextStyle1(
                                "Name",
                                18,
                                const Color(0xFFFFFFFF),
                                FontWeight.w600,
                                TextAlign.center,
                                FontStyle.normal),
                          )
                        ],
                      )
                    ],
                  )
                  // Container(child: ,)
                ],
              ),
            ),
          ),
        ));
  }
}
