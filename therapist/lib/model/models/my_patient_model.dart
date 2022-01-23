import 'package:flutter/material.dart';

class MyPatientModel {
  final String imgPath, name, disease;

  MyPatientModel({
    @required this.imgPath,
    @required this.name,
    @required this.disease,
  });
}

List<MyPatientModel> patientModelList = [
  MyPatientModel(
    imgPath: 'assets/images/girl.png',
    name: 'Jaculine',
    disease: 'Cancer Disease',
  ),
  MyPatientModel(
    imgPath: 'assets/images/girl.png',
    name: 'Danny',
    disease: 'Cancer Disease',
  ),
  MyPatientModel(
    imgPath: 'assets/images/girl.png',
    name: 'Kendra',
    disease: 'Cancer Disease',
  ),
  MyPatientModel(
    imgPath: 'assets/images/girl.png',
    name: 'Jaculine',
    disease: 'Cancer Disease',
  ),
];
