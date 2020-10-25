import 'dart:convert';

import 'package:test1/Models/parsedTimetable.dart';
import 'package:test1/Screens/TimeTable/Components/class_card.dart';
import 'package:test1/Screens/TimeTable/Components/timetable.dart';
import 'package:test1/Utils/local_storage_handler.dart';
import 'package:test1/Values/colors.dart';
import 'package:flutter/material.dart';

class FreindTimeTable extends StatefulWidget {
//  ParsedTimetable parsedTimetable;
  var email  ;
  FreindTimeTable({ this.email});
  @override
  _FreindTimeTableState createState() => _FreindTimeTableState();
}

class _FreindTimeTableState extends State<FreindTimeTable> {
  var response  ;
  @override
  void initState() {
    // TODO: implement initState
    response = json.decode(StorageHandler().getValue(widget.email)) ;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    int section1 = 17;
    int section2 = 18;
    int section3 = 65;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(
          color: themeGrey,
          size: 3,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: section1,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                        widget.email,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 38,
                              color: themeColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Flexible(
              flex: section2,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                    color: Colors.red,
                    child: Column(
//                          mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[
                        new Text(
                          "Upcoming class",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width -
                                            40),
                                child: new ClassCard(
                                  upcoming: true,
                                )),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Flexible(
              flex: section3,
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
//                    color: Colors.amber,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                            flex: 17,
                            child: Container(
//                              color: Colors.green,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          new Text(
                                            "Shakeeb's TimeTable",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Flexible(
                          flex: 83,
                          child: Container(
                            color: Colors.blue,
                            child: TimeTable(timeTable: ParsedTimetable.fromJson(
                              json.decode(
                                  StorageHandler().getValue(widget.email)),
                            )),
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
