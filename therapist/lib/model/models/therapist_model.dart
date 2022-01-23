import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Therapist {
  String name,
      password,
      email,
      uid,
      licenseNo,
      gender,
      city,
      fbUsername,
      igUsername,
      websiteURL,
      profileImageURL,
      twitterUsername;

  int contactNumber, postalCode;

  Therapist({
    @required this.uid,
    @required this.name,
    this.email,
    this.profileImageURL =
        'https://thumbs.dreamstime.com/b/default-avatar-profile-vector-user-profile-default-avatar-profile-vector-user-profile-profile-179376714.jpg',
    @required this.password,
    this.licenseNo,
    this.gender,
    this.city,
    this.fbUsername,
    this.igUsername,
    this.websiteURL,
    this.twitterUsername,
    this.contactNumber,
    this.postalCode,
  });

  Therapist.fromDocumentSnapshot(DocumentSnapshot doc) {
    this.name = doc['name'];
    this.email = doc['email'];
    this.password = doc['password'];
    this.licenseNo = doc['licenseNo'];
    this.gender = doc['gender'];
    this.city = doc['city'];
    this.fbUsername = doc['fbUsername'];
    this.igUsername = doc['igUsername'];
    this.websiteURL = doc['websiteURL'];
    this.twitterUsername = doc['twitterUsername'];
    this.contactNumber = doc['contactNumber'];
    this.postalCode = doc['postalCode'];
  }
}
