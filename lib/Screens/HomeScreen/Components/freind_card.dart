import 'dart:convert';

import 'package:test1/Models/config.dart';
import 'package:test1/Models/course.dart';
import 'package:test1/Models/course_class.dart';
import 'package:test1/Models/parsedTimetable.dart';
import 'package:test1/Utils/local_storage_handler.dart';
import 'package:test1/Values/colors.dart';
import 'package:flutter/material.dart';

class FreindCard extends StatefulWidget {
  String email;
  FreindCard({@required this.email});

  @override
  _FreindCardState createState() => _FreindCardState();
}

class _FreindCardState extends State<FreindCard> {
  CourseClass courseClass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseClass = ParsedTimetable.fromJson(
            json.decode(StorageHandler().getValue(widget.email)))
        .getUpcomingClass();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: themeColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [themeColor, themeSecondary],
            ),
            borderRadius: BorderRadius.all(Radius.circular(16))),
//        height: 134,
        width: 120,
        child: Column(
          children: <Widget>[
//            name and roll number start
            Flexible(
              flex: 30,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                      color: Colors.green,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: new Text(widget.email,
                              overflow: TextOverflow.ellipsis,
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                        new Text("",
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )),
                ],
              ),
            ),
//            name and roll number start

//           class start
            Flexible(
              flex: 40,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                      color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          courseClass.venue,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
//           class end

//          teacher name start
            Flexible(
              flex: 30,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                      color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          courseClass.name,
                          overflow: TextOverflow.ellipsis,
                          style:
                              new TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            )
            //          teacher name end
          ],
        ),
      ),
    );
  }
}
