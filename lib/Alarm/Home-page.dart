import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import "package:flutter/material.dart";
import 'package:fresh_wake/Alarm/Alarm-Page.dart';
import 'package:fresh_wake/Alarm/Profile-Page.dart';
import 'package:fresh_wake/Widgets.dart';
import 'package:fresh_wake/theme.dart';

int _currentIndex = 0;
late String valueText;
final Listkey = const Key("ListKey");
bool _showAgentsContainer = true;
bool _showNewsContainer = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime dateTime = DateTime.now();

  get myString => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Fresh Wake"),
      //   centerTitle: true,
      //   backgroundColor: Color(0xFF1A1A1A),
      //   elevation: 0,
      // ),
      bottomNavigationBar: bottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: FontColor_Purple,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AlarmPage();
          }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: FontColor_Black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              Visibility(
                visible: _showAgentsContainer,
                child: HomePageWidget(),
              ),
              Visibility(
                  visible: _showNewsContainer,
                  child: const StopWatchTimerPage()),
            ],
          )),
        ),
      ),
    );
  }

  Widget HomePageWidget() {
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
          child: TextStyle1("Saved Alarm", 16, FontColor_White, FontWeight.w600,
              TextAlign.center, FontStyle.normal),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: CardListView(),
        ),
      ],
    );
  }

  Widget DisplayWidget() {
    return Column(
      children: [
        Container(
          color: FontColor_Black,
          child: Row(
            children: [
              ImageWidget("asset/Night.png", 50, 50, () {}),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyle1("Good Night", 16, FontColor_White, FontWeight.bold,
                      TextAlign.center, FontStyle.normal),
                  TextStyle1("Ryan", 16, FontColor_White, FontWeight.bold,
                      TextAlign.center, FontStyle.normal)
                ],
              )
            ],
          ),
        ),
        TextStyle1("Tue 10th May, 2022", 13, FontColor_White, FontWeight.w400,
            TextAlign.center, FontStyle.normal),
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
          TextStyle1("Average Sleep", 16, FontColor_White, FontWeight.w700,
              TextAlign.center, FontStyle.normal),
          TextStyle1("7 hours last week", 12, FontColor_White, FontWeight.w500,
              TextAlign.center, FontStyle.normal),
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
                                FontColor_Darkpink,
                                FontColor_Purpletheme
                              ])),
                      child: SizedBox(
                        height: WeekDaysCount[index],
                        // WeekDaysCount[index],
                        width: 7,
                      ),
                    ),
                  ),
                  TextStyle1(WeekDays[index], 14, FontColor_Whitetheme,
                      FontWeight.w500, TextAlign.center, FontStyle.normal),
                ]);
          }),
    );
  }

  Widget CardListView() {
    return ListView.builder(
      key: Listkey,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: cardList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          child: cardList[index],
          onDismissed: (direction) {
            setState(() {
              cardList.removeAt(index);
            });
          },
        );
      },
    );
  }

  Widget bottomNavBar() {
    return CurvedNavigationBar(
      items: <Widget>[
        ImageIcon(
          const AssetImage('asset/Bell.png'),
          size: 35,
          color: FontColor_Purpletheme,
        ),
        ImageIcon(
          const AssetImage('asset/Timer.png'),
          size: 35,
          color: FontColor_Purpletheme,
        )
      ],
      height: 55,
      color: FontColor_Darkgrey,
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

class StopWatchTimerPage extends StatefulWidget {
  const StopWatchTimerPage({Key? key}) : super(key: key);

  @override
  _StopWatchTimerPageState createState() => _StopWatchTimerPageState();
}

class _StopWatchTimerPageState extends State<StopWatchTimerPage> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  //creating the stop timer

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  //creating reset function\

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";
      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  //creating the start timer function
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;

        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Stopwatch App",
                style: TextStyle(
                    color: FontColor_White,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                "$digitHours:$digitMinutes:$digitSeconds",
                style: TextStyle(
                    color: FontColor_White,
                    fontSize: 82.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: 400.0,
              decoration: BoxDecoration(
                  color: FontColor_Blacktheme,
                  borderRadius: BorderRadius.circular(8)),
              //now let's add a list builder

              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lap ${index + 1}',
                          style: TextStyle(
                            color: FontColor_White,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "${laps[index]}",
                          style:
                              TextStyle(color: FontColor_White, fontSize: 16.0),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RawMaterialButton(
                    onPressed: () {
                      (!started) ? start() : stop();
                    },
                    shape: StadiumBorder(
                        side: BorderSide(color: FontColor_Blacktheme)),
                    child: Text(
                      (!started) ? "Start" : "Pause",
                      style: TextStyle(color: FontColor_White),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                IconButton(
                    color: FontColor_White,
                    onPressed: () {
                      addLaps();
                    },
                    icon: const Icon(Icons.flag)),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: RawMaterialButton(
                  onPressed: () {
                    reset();
                  },
                  fillColor: FontColor_Blacktheme,
                  shape: const StadiumBorder(),
                  child: Text(
                    "Reset",
                    style: TextStyle(color: FontColor_White),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
