import 'dart:convert';

import 'package:test1/Models/parsedTimetable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler {
  static SharedPreferences preferences;
  static final StorageHandler _singleton = new StorageHandler._internal();

  factory StorageHandler() {
    return _singleton;
  }

  static initialize() async {
    preferences = await SharedPreferences.getInstance();
    return true;
  }

  setValue(String key, String value) {
    preferences.setString(key, value);
  }

  String getValue(String key) {
//    todo: do keyerror handling here
    return preferences.getString(key);
  }

  ParsedTimetable getParsedTimetable(String email) {
    Map<String, dynamic> timetable = json.decode(this.getValue(email));
    return ParsedTimetable.fromJson(timetable);
  }

  bool containsKey(String key) {
    return preferences.containsKey(key);
  }

  StorageHandler._internal() {}
}
