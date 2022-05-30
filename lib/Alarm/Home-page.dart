import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:fresh_wake/Widgets.dart';

List<double> WeekDaysCount = [54, 80, 100, 50, 60, 99, 70];
List<String> WeekDays = ["M", "T", "W", "T", "F", "S", "S"];

int _currentIndex = 0;

bool _showAgentsContainer = true;
bool _showNewsContainer = false;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavBar(),
        floatingActionButton: FloatactionBar(),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 40, right: 40, left: 33),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageWidget("asset/Profile.png", 53, 53),
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
                    child: TextStyle1("Saved Alarm", 16, Color(0xFFE7E3E3),
                        FontWeight.w600, TextAlign.center, FontStyle.normal),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget DisplayWidget() {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: Row(
            children: [
              ImageWidget("asset/Night.png", 50, 50),
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
    return Container(
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
                    width: MediaQuery.of(context).size.width / 9,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 13,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
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

  Widget bottomNavBar() {
    return CurvedNavigationBar(
      items: const <Widget>[
        Icon(Icons.segment, size: 35, color: Colors.deepPurpleAccent),
        Icon(Icons.newspaper, size: 35, color: Colors.deepPurpleAccent),
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
