import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Patient {
  String name,
      bloodGroup,
      maritalStatus,
      gender,
      profileImageURL,
      password,
      uid;
  int contactNumber, emergencyContactNumber;
  double height, weight;
  String email;
  DateTime dob;
  bool isReviewd = false;
  Patient({
    @required this.name,
    this.bloodGroup,
    this.maritalStatus,
    this.gender,
    this.profileImageURL =
        'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg',
    this.contactNumber,
    this.emergencyContactNumber,
    this.height,
    this.weight,
    @required this.email,
    this.dob,
    @required this.uid,
    @required this.password,
  });

  Patient.fromDocumentSnapshot(DocumentSnapshot doc) {
    this.name = doc['name'];
    this.email = doc['email'];
    this.password = doc['password'];
    this.dob = doc['dob'];
    this.bloodGroup = doc['bloodGroup'];
    this.maritalStatus = doc['maritalStatus'];
    this.gender = doc['gender'];
    this.profileImageURL = doc['profileImageURL'];
    this.contactNumber = doc['contactNumber'];
    this.emergencyContactNumber = doc['emergencyContactNumber'];
    this.height = doc['height'];
    this.weight = doc['weight'];
    this.uid = doc['uid'];
  }
}
