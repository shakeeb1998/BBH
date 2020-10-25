import 'dart:convert';

import 'package:test1/Models/config.dart';
import 'package:test1/Utils/connectionStatus.dart';
import 'package:test1/Utils/local_storage_handler.dart';
import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:test1/Utils/timetableMock.dart';

class RequestManager {
  static final RequestManager _singleton = new RequestManager._internal();
  Dio dio;
  StorageHandler storageHandler;

  getCourses() async {
    String url = Config.baseUrl + Config.getAllClassesRoute;
    print(url);
    Response response = await dio.get(url);
    return response.data;
  }

  getCompleteTimetable() async {
    String url = Config.baseUrl + Config.getCompleteTimetableRoute;
    Response response = await dio.get(url);
    storageHandler.setValue(
        Config.completeTimetableKey, json.encode(response.data));
  }

  updateCoursesList(dynamic coureseList) async {
    String url = Config.baseUrl + Config.updateCourseRoute;

    try {
      Response response = await dio.post(url,
          data: {
            'courses': coureseList,
          },
          options: Options(headers: {"Authorization": Config.currentUser.uid}));

      try {
        getClasses(email: Config.currentUser.email);
      } on DioError catch (e) {
        print("error");
      }
      StorageHandler().setValue(Config.courseListKey, json.encode(coureseList));

      print("donr");
      return true;
    } on DioError catch (e) {
      print('here');
      print(e.response.headers);
      return false;
    }
  }

  Future<bool> getClasses({@required String email}) async {
      print(email);
      print(MockTimeTable.emails);
      // if (MockTimeTable.emails.contains(MockTimeTable.emails))

          print("here");
          if (email==MockTimeTable.emailKrinza)
            {
              storageHandler.setValue(email, MockTimeTable.krinza);
              print("setting");
              return true;

            }
          else if (email==MockTimeTable.emailSHakeeb)
            {
              storageHandler.setValue(email, MockTimeTable.shakeeb);
              return true;

            }
          else if (email==MockTimeTable.emailTaban)
          {
            storageHandler.setValue(email, MockTimeTable.taban);
            return true;

          }  else if (email==MockTimeTable.fatima)
          {
            storageHandler.setValue(email, MockTimeTable.fatima);
            return true;

          }

      else
        {
        return false;
      }

  }

  factory RequestManager() {
    return _singleton;
  }

  RequestManager._internal() {
    dio = new Dio();
    storageHandler = new StorageHandler();
  }
}
