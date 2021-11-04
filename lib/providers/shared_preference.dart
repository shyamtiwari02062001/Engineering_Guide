import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends ChangeNotifier {
  bool isSeen = false;
  String selectedCourse = "";
  int semIndex = 0;
  Future<void> sharedData() async {
    final pref = await SharedPreferences.getInstance();
    final val = json.decode(pref.getString("value")!) as Map<String, dynamic>;
    isSeen = val['isSeen'];
    selectedCourse = val['setSelected'];
    semIndex = val['semIndex'];
  }

  String get selectedCourseData {
    return selectedCourse;
  }

  bool get isSeenScreen {
    return isSeen;
  }

  int get semesterIndex {
    return semIndex;
  }
}
