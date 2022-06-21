import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresh_wake/Alarm/Home-page.dart';
import 'package:fresh_wake/Widgets.dart';

List<Widget> cardList = [];
bool isSwitched = true;
DateTime dateTime = DateTime.now();
var textValue = 'Switch is OFF';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 190,
            width: MediaQuery.of(context).size.width,
            child: AnalogClock(
              decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Color(0xFF1A1A1A)),
                  color: Color(0xFF1A1A1A),
                  shape: BoxShape.circle),
              // decoration
              isLive: false,
              hourHandColor: Colors.transparent,
              minuteHandColor: Colors.transparent,
              showSecondHand: false,
              numberColor: Colors.white,

              showNumbers: true,
              textScaleFactor: 2.2,
              showTicks: false,
              showDigitalClock: false,
              digitalClockColor: Colors.white,
              showAllNumbers: true,
              datetime: dateTime,
            ),
          ),
          TextStyle1('Product Details', 20, Colors.black, FontWeight.bold,
              TextAlign.center, FontStyle.normal),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFFFFFF)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFFFFFFF)),
                width: MediaQuery.of(context).size.width / 8,
                margin: const EdgeInsets.all(10),
                child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2),
                  ],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    setState(() {
                      valueText = value;
                    });
                  },
                  controller: NameController,
                  decoration: const InputDecoration(
                    hintText: "HH",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFFFFFFF)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFFFFFFFF)),
                width: MediaQuery.of(context).size.width / 8,
                margin: const EdgeInsets.all(10),
                child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2),
                  ],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      valueText = value;
                    });
                  },
                  controller: BrandController,
                  decoration: const InputDecoration(
                    hintText: "MM",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),

            ],
          ),
          ElevatedButton(
            child: TextStyle1('Save', 20, Colors.black, FontWeight.bold,
                TextAlign.center, FontStyle.normal),
            onPressed: () {
              setState(
                () {
                  String Name = NameController.text;
                  String Price = PriceController.text;
                  String Brand = BrandController.text;
                  String Category = CategoryController.text;

                  userdata.write('Category', Category);
                  userdata.write('Brand', Brand);
                  userdata.write('Name', Name);
                  userdata.write('Price', Price);

                  if (Name == "" || Price == "" || Brand == "") {
                    final snackBar = SnackBar(
                      content:
                          const Text('Please enter all the product details!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    cardList.add(_card());
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _card() {
    return Card(
      color: Color(0xFF313334),
      child: ListTile(
          onTap: () {
            toggleSwitch(!isSwitched);
          },
          leading: CircleAvatar(
            radius: 23,
            child: ImageWidget("asset/Alarm Bell.png", 46, 46, () {}),
          ),
          title: TextStyle1("${userdata.read('Price')} | Drug", 20,
              Colors.white, FontWeight.w600, TextAlign.left, FontStyle.normal),
          subtitle: WeekDaysList(),
          trailing: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          )),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  Widget WeekDaysList() {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(children: [
              Container(
                width: MediaQuery.of(context).size.width / 20,
              ),
              TextStyle1(WeekDays[index], 14, const Color(0xFFE0E0E0),
                  FontWeight.w500, TextAlign.center, FontStyle.normal),
            ]);
          }),
    );
  }
}
