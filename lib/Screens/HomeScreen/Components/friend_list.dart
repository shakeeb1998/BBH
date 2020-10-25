import 'dart:convert';

import 'package:test1/Models/config.dart';
import 'package:test1/Screens/FriendTimeTable/friend_timetable_screen.dart';
import 'package:test1/Utils/local_storage_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'freind_card.dart';
class FriendLists extends StatefulWidget {
  @override
  _FriendListState createState() => _FriendListState();
}

class _FriendListState extends State<FriendLists> {
  var list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print()
    String frends=StorageHandler().getValue(Config.friendsListKey);

//    list=[];
  }

  @override
  Widget build(BuildContext context) {
    String frends=StorageHandler().getValue(Config.friendsListKey);

    if(frends!= null && frends!='null'){
      list=(json.decode(frends));
    }
//
//    print(list);
//    print("--------");
    return Container(
//      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0,right: 16),
        scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (BuildContext context,int index){
        return InkWell(
            child: FreindCard(email: list[index],),
            onTap: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context)=>FreindTimeTable(email: list[index],)));
        },
        );
      }),
    );
  }
}
