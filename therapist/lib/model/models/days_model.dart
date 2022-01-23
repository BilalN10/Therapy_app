import 'package:flutter/widgets.dart';

class DaysModel {
  final String dayName;

  DaysModel({
    @required this.dayName,
  });
}

List<DaysModel> dayList = [
  DaysModel(dayName: 'Mon'),
  DaysModel(dayName: 'Tue'),
  DaysModel(dayName: 'Wed'),
  DaysModel(dayName: 'Thu'),
  DaysModel(dayName: 'Fri'),
  DaysModel(dayName: 'Sat'),
  DaysModel(dayName: 'Sun'),
];
