import 'dart:convert';

import 'package:test1/Models/config.dart';
import 'package:test1/Models/parsedTimetable.dart';
import 'package:test1/Screens/AddFriends/add_freinds_screen.dart';
import 'package:test1/Screens/Attendance/attendance_screen.dart';
import 'package:test1/Screens/CompleteTimeTable/CompleteTimeTableScreen.dart';
import 'package:test1/Screens/splashScreen/splashscreen.dart';
import 'package:test1/Utils/connectionStatus.dart';
import 'package:test1/Utils/local_storage_handler.dart';
import 'package:test1/Utils/request_manager.dart';
import 'package:test1/Utils/signin_with_google.dart';
import 'package:test1/Utils/timetableMock.dart';
import 'package:test1/Utils/validators.dart';
import 'package:test1/Values/colors.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:test1/Screens/FriendTimeTable/friend_timetable_screen.dart';
import 'package:test1/Screens/TimeTable/timetable_screen.dart';
import "package:test1/Screens/CourseAddDrop/course_add_drop_screen.dart";
import 'package:test1/Screens/Drawer/Components/DrawerComponent.dart';
import 'package:test1/Models/course.dart';
import 'package:test1/Screens/FriendsList/friend_list.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<Course> a = [];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [themeColor,themeSecondary],
              begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            accountName: new Text("Krinza"), accountEmail: new Text("krinzamomin@gmail.com"),
          currentAccountPicture: CircleAvatar(
//            child: new Image.network(Config.currentUser.displayName),
            backgroundImage: NetworkImage("https://assets.about.me/background/users/k/r/i/krinzamomin_1581931880_125.jpg"),

          ),
          ),
          DrawerComponent(
            name: "Timetable Screen",
            child: TimeTableScreen(
                TimeTable: ParsedTimetable.fromJson(
              json.decode(
                  StorageHandler().getValue(MockTimeTable.emailKrinza)),
            )),
            trail: Icon(Icons.people),
          ),
//          DrawerComponent(
//            name: "FreindTimeTable",
//            child: FreindTimeTable(),
//            trail: Icon(Icons.people),
//          ),

          InkWell(
              onTap: () async {
                if (await checkConnectionStatus()) {
//                  todo add loader
//                 var map = await RequestManager().getCourses();
                  List<dynamic> list = await RequestManager().getCourses();
                  for (dynamic i in list) {
                    a.add(Course(id: i['id'], name: i['name']));
                  }

                  Widget course = CourseAddDrop(
                    sugesstion: a,
                  );
                  print("addding courses");
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => course));
                } else {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("Needs Internet")));
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: new Text("Course Add Drop"),
                    leading: Icon(Icons.adjust),
                  ),
                  new Divider()
                ],
              )),

          DrawerComponent(
            name: "Complete Timetable",
            child: CompleteTimeTableScreen(completeTimetable: json.decode(MockTimeTable.krinza),),
            trail: Icon(Icons.calendar_today),
          ),
          DrawerComponent(
            name: "Add friends",
            child: AddFriendsScreen(),
            trail: Icon(Icons.people),
          ),
          DrawerComponent(
            name: "Attendance",
            child: AttendanceScreen(),
            trail: Icon(Icons.add_circle),
          ),
          ListTile(
            title: Text("Log Out"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              StorageHandler.preferences.clear();
              signOutGoogle();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => StartScreen()));
            },
          )
        ],
      ),
    );
  }
}
