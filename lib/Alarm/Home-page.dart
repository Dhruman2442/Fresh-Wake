import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:fresh_wake/Alarm/Alarm-Page.dart';
import 'package:fresh_wake/Alarm/Profile-Page.dart';
import 'package:fresh_wake/Utils.dart';
import 'package:fresh_wake/Widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

List<double> WeekDaysCount = [54, 80, 100, 50, 60, 99, 70];
List<String> WeekDays = ["M", "T", "W", "T", "F", "S", "S"];

final scaffoldState = GlobalKey<ScaffoldState>();

TextEditingController PriceController = TextEditingController();
TextEditingController BrandController = TextEditingController();

TextEditingController NameController = TextEditingController();
TextEditingController CategoryController = TextEditingController();
int _currentIndex = 0;
late String valueText;

final userdata = GetStorage();
bool _showAgentsContainer = true;
bool _showNewsContainer = false;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF7C4DFF),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AlarmPage();
          }));
        },
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Visibility(
                visible: _showAgentsContainer,
                child: AlarmPage(),
              ),
              Visibility(child: TimerPage(), visible: _showNewsContainer),
            ],
          )),
        ),
      ),
    );
  }

  Widget AlarmPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40, right: 18, left: 33),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageWidget("asset/Profile.png", 53, 53, () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              }),
              Container(
                child: DisplayWidget(),
              )
            ],
          ),
        ),
        Container(
          child: DisplayBarCard(),
        ),
        Container(
          padding: const EdgeInsets.only(right: 40, left: 33),
          child: TextStyle1("Saved Alarm", 16, const Color(0xFFE7E3E3),
              FontWeight.w600, TextAlign.center, FontStyle.normal),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: CardListView(),
        ),
      ],
    );
  }

  Widget TimerPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTimePicker(),
        const SizedBox(height: 24),
        ButtonWidget(
          onClicked: () => Utils.showSheet(
            context,
            child: buildTimePicker(),
            onClicked: () {
              final value = DateFormat('HH:mm').format(dateTime);
              Utils.showSnackBar(context, 'Selected "$value"');

              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 10,
          backgroundColor: const Color(0xFF222424),
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }

  Widget DisplayWidget() {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Row(
            children: [
              ImageWidget("asset/Night.png", 50, 50, () {}),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyle1("Good Night", 16, const Color(0xFFFFFFFF),
                      FontWeight.bold, TextAlign.center, FontStyle.normal),
                  TextStyle1("Ryan", 16, const Color(0xFFFFFFFF),
                      FontWeight.bold, TextAlign.center, FontStyle.normal)
                ],
              )
            ],
          ),
        ),
        TextStyle1("Tue 10th May, 2022", 13, const Color(0xFFFFFFFF),
            FontWeight.w400, TextAlign.center, FontStyle.normal),
      ],
    );
  }

  Widget DisplayBarCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      color: const Color(0xCC313334),
      margin: const EdgeInsets.all(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: 215,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextStyle1("Average Sleep", 16, const Color(0xFFE7E3E3),
              FontWeight.w700, TextAlign.center, FontStyle.normal),
          TextStyle1("7 hours last week", 12, const Color(0xFFE0E0E0),
              FontWeight.w500, TextAlign.center, FontStyle.normal),
          BarChart()
        ]),
      ),
    );
  }

  Widget BarChart() {
    return SizedBox(
      height: 151,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 8.8,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 13,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.pink.shade900,
                                Colors.deepPurple
                              ])),
                      child: SizedBox(
                        height: WeekDaysCount[index],
                        // WeekDaysCount[index],
                        width: 7,
                      ),
                    ),
                  ),
                  TextStyle1(WeekDays[index], 14, const Color(0xFFE0E0E0),
                      FontWeight.w500, TextAlign.center, FontStyle.normal),
                ]);
          }),
    );
  }

  Widget CardListView() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cardList.length,
      itemBuilder: (context, index) {
        return cardList[index];
      },
    );
  }

  Widget bottomNavBar() {
    return CurvedNavigationBar(
      items: const <Widget>[
        ImageIcon(
          AssetImage('asset/Bell.png'),
          size: 35,
          color: Color(0xFF6265C3),
        ),
        ImageIcon(
          AssetImage('asset/Timer.png'),
          size: 35,
          color: Color(0xFF6265C3),
        )
      ],
      height: 55,
      color: Colors.grey.shade900,
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (value) {
        setState(() {
          setState(() {
            _currentIndex = value;
            if (_currentIndex == 0) {
              _showNewsContainer = false;
              _showAgentsContainer = true;
            }
            if (_currentIndex == 1) {
              _showNewsContainer = true;
              _showAgentsContainer = false;
            }
          });
        });
      },
    );
  }
}
