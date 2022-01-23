import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/model/data.dart';

class ProfileController extends GetxController {
  DateTime dob = DateTime.utc(1999, 02, 02);

  bool isLoading = false;

  String userID;

  void updateUID(String uid) {
    userID = uid;
    update();
  }

  void updateDropDownValue(String key, String newValue) {
    dropDownData[key]['value'] = newValue;
    //print(newValue);
    update();
  }

  void updateDOB(DateTime date) {
    dob = date;
    update();
  }

  void changeLoading({@required bool loading}) {
    isLoading = loading;
    update();
  }
}
