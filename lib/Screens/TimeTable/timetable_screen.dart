import 'package:test1/Models/course_class.dart';
import 'package:test1/Models/parsedTimetable.dart';
import 'package:test1/Screens/TimeTable/Components/timetable.dart';
import 'package:flutter/material.dart';
import 'package:test1/Values/colors.dart';
class TimeTableScreen extends StatefulWidget {

  ParsedTimetable TimeTable;
  TimeTableScreen({this.TimeTable});


  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    double leftPadding=18.0;
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: new AppBar(backgroundColor: Colors.white,elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left:leftPadding),
          child: new Text("Timetable",style: TextStyle(color: themeColor,fontSize: 40),),
        ),
        Expanded(child: Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20),
          child: TimeTable(timeTable: widget.TimeTable,),
        ))

      ],),
    );
  }
}
