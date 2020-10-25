import 'package:test1/Models/course_class.dart';
import 'package:test1/Screens/Attendance/Components/qr_reader.dart';
import 'package:test1/Screens/TimeTable/Components/class_card.dart';
import 'package:test1/Values/colors.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(backgroundColor: Colors.white,elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: <Widget>[

          Flexible(
            flex: 15,
            child: Column(
              children: <Widget>[
                Expanded(child: Container(
//                  color: Colors.green,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Text("Active Classes",style: TextStyle(fontSize: 32,color: themeColor),),
                      )),
                )
                ),
              ],
            ),
          ),



      Flexible(
        flex: 85,
        child: Column(
          children: <Widget>[
            Expanded(child: Container(
//              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child: new ListView(
                  children: <Widget>[
                    InkWell(
                        child: ClassCard(name: "PF-1D(G,H)",time: "8:00-9:00",venue: 'E6',),
                      onTap: (){
                          Navigator.push(context, new MaterialPageRoute(builder: (context)=>QrReader()));
                      },
                    ),
                    ClassCard(name: "PF-1D(A,B)",time: "9:00-10:00",venue: 'E6',)

                  ],
                ),
              ),
            ),
            ),
          ],
        )
      )
        ],
      ),
    );
  }
}
