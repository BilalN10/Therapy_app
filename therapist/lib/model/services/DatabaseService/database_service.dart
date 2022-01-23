import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:therapist/controller/profile_controller.dart';
import 'package:therapist/model/models/patient_model.dart';
import 'package:get/get.dart';
import 'package:therapist/model/models/therapist_model.dart';

class DatabaseService {
  final CollectionReference _patientCollection =
      FirebaseFirestore.instance.collection('patients');
  final CollectionReference _therapistCollection =
      FirebaseFirestore.instance.collection('therapists');
  final _profileController = Get.find<ProfileController>();

  Future<bool> createNewPatientInDB({@required Patient patient}) async {
    try {
      _profileController.changeLoading(loading: true);
      await _patientCollection.doc(patient.uid).set({
        'name': patient.name,
        'email': patient.email,
        'contactNumber': patient.contactNumber,
        'emergencyContactNumber': patient.emergencyContactNumber,
        'gender': patient.gender,
        'dob': patient.dob,
        'bloodGroup': patient.bloodGroup,
        'maritalstatus': patient.maritalStatus,
        'height': patient.height,
        'weight': patient.weight,
        'profileImageURL': patient.profileImageURL,
        'password': patient.password,
      });
      _profileController.changeLoading(loading: false);
      return true;
    } catch (e) {
      //  print(e.toString());
    }
    _profileController.changeLoading(loading: false);
    return false;
  }

  Future<bool> createNewTherapistInDB({@required Therapist therapist}) async {
    try {
      _profileController.changeLoading(loading: true);
      await _therapistCollection.doc(therapist.uid).set({
        'name': therapist.name,
        'email': therapist.email,
        'password': therapist.password,
        'contactNumber': therapist.contactNumber,
        'gender': therapist.gender,
        'profileImageURL': therapist.profileImageURL,
        'licenseNo': therapist.licenseNo,
        'city': therapist.city,
        'postalCode': therapist.postalCode,
        'fbUsername': therapist.fbUsername,
        'igUsername': therapist.igUsername,
        'twitterUsername': therapist.twitterUsername,
        'websiteURL': therapist.websiteURL,
      });
      _profileController.changeLoading(loading: false);
      return true;
    } catch (e) {
      //  print(e.toString());
    }
    _profileController.changeLoading(loading: false);
    return false;
  }
}
