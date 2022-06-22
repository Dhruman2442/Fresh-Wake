import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import "package:flutter/material.dart";
import 'package:fresh_wake/Alarm/Alarm-Page.dart';
import 'package:fresh_wake/Alarm/Profile-Page.dart';
import 'package:fresh_wake/Widgets.dart';

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
        backgroundColor: const Color(0xFF7C4DFF),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AlarmPage();
          }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,
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
                  visible: _showNewsContainer, child: const StopWatchTimerPage()),
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
            const Center(
              child: Text(
                "Stopwatch App",
                style: TextStyle(
                    color: Colors.white,
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
                style: const TextStyle(
                    color: Colors.white,
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
                  color: const Color(0xFF1A1A1A),
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "${laps[index]}",
                          style: const TextStyle(color: Colors.white, fontSize: 16.0),
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
                    shape: const StadiumBorder(
                        side: BorderSide(color: Color(0xFF1A1A1A))),
                    child: Text(
                      (!started) ? "Start" : "Pause",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                IconButton(
                    color: Colors.white,
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
                  fillColor: const Color(0xFF1A1A1A),
                  shape: const StadiumBorder(),
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;

  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      this.color = Colors.white,
      this.backgroundColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: color),
      ));
}
