import 'package:flutter/material.dart';
import 'package:fresh_wake/Alarm/Home-page.dart';
import 'package:fresh_wake/Widgets.dart';

List<Widget> cardList = [];
bool isSwitched = true;

var textValue = 'Switch is OFF';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();
    isSwitched = true;
    textValue = 'Switch is ON';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextStyle1('Product Details', 20, Colors.black, FontWeight.bold,
              TextAlign.center, FontStyle.normal),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.name,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: NameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.name,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: BrandController,
              decoration: const InputDecoration(hintText: "Brand"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: PriceController,
              decoration: const InputDecoration(hintText: "Price"),
            ),
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
            child: ImageWidget("asset/Alarm Bell.png", 46, 46,(){}),
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
