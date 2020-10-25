import 'package:test1/Values/colors.dart';
import 'package:flutter/material.dart';

import 'Components/upper_scaffold.dart';


class CompleteTimeTableScreen extends StatefulWidget {
  var completeTimetable;
  CompleteTimeTableScreen({this.completeTimetable});
  @override
  _CompleteTimeTableScreenState createState() => _CompleteTimeTableScreenState();
}

class _CompleteTimeTableScreenState extends State<CompleteTimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:0.0,right: 0),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(flex: 12,
            child: new Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Center(child: Row(
                    children: <Widget>[
                      Padding(
                        padding:  EdgeInsets.only(left:20.0),
                        child: new Text("How you doin !!!!",style: TextStyle(
                            color: themeColor,
                            fontSize: 41,
                            fontWeight: FontWeight.w400),),
                      ),
                    ],
                  ))),
                ],
              ),
            ),
            ),
            Flexible(
              flex: 85,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      child: Center(
                          child: Column(
                            children: <Widget>[
                              Flexible(child: UpperScaffold(completeTimeTable: widget.completeTimetable,))                          ],
                          )
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
