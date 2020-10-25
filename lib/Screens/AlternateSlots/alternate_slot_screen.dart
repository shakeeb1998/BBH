import 'package:test1/Screens/TimeTable/Components/class_card.dart';
import 'package:test1/Values/colors.dart';
import 'package:flutter/material.dart';


class AlternateSlotScreen extends StatefulWidget {
  @override
  _AlternateSlotScreenState createState() => _AlternateSlotScreenState();
}

class _AlternateSlotScreenState extends State<AlternateSlotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20,bottom: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                new Text("Alternate Slots",style: TextStyle(color: themeColor,fontSize: 32),),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ClassCard(venue: "E4",time: '9:00-9:55',name: "IR-6B(D,E)",),
                ClassCard(venue: "E4",time: '11:00-11:55',name: "IR-6C(F,G)",),
              ],
            )

          ],
        ),
      ),
    );
  }
}
