// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';

import 'package:therapist/model/models/patient_model.dart';

enum Gender {
  Male,
  Female,
}

enum MessageStatus {
  Pending,
  Delivered,
  Seen,
}

enum MessageType {
  Text,
  Media,
  File,
}

List<Map<String, String>> therapistCategories = [
  {
    'specialisty': 'AQUATIC THERAPY',
    'imgPath': 'assets/icons/aquatherapy.png',
  },
  {
    'specialisty': 'Audiologist',
    'imgPath': 'assets/icons/audiotherapy.png',
  },
  {
    'specialisty': 'BCBA',
    'imgPath': 'assets/icons/BCBA.png',
  },
  {
    'specialisty': 'Dance Therapist',
    'imgPath': 'assets/icons/dancingtherapy.png',
  },
  {
    'specialisty': 'Dietician',
    'imgPath': 'assets/icons/dietian.png',
  },
  {
    'specialisty': 'Dir Floortime specialist',
    'imgPath': 'assets/icons/Dir floortime specialist.png',
  },
  {
    'specialisty': 'Feeding Therapist',
    'imgPath': 'assets/icons/feeding theraoy.png',
  },
  {
    'specialisty': 'Horse Therapy',
    'imgPath': 'assets/icons/horse therapy.png',
  },
  {
    'specialisty': 'Lactation Consultant',
    'imgPath': 'assets/icons/lactation consultant.png',
  },
  {
    'specialisty': 'Music Therapist',
    'imgPath': 'assets/icons/Music therapy.png',
  },
  {
    'specialisty': 'Occupational Therapist',
    'imgPath': 'assets/icons/occupational therapist.png',
  },
  {
    'specialisty': 'P3',
    'imgPath': 'assets/icons/P3.png',
  },
  {
    'specialisty': 'Para',
    'imgPath': 'assets/icons/PARA.png',
  },
  {
    'specialisty': 'PET Therapy',
    'imgPath': 'assets/icons/PET therapy.png',
  },
  {
    'specialisty': 'Physical Therapist',
    'imgPath': 'assets/icons/physical-therapy.png',
  },
  {
    'specialisty': 'Psychologist',
    'imgPath': 'assets/icons/psychologist.png',
  },
  {
    'specialisty': 'Recreational Therapist',
    'imgPath': 'assets/icons/interview.png',
  },
  {
    'specialisty': 'Social Worker',
    'imgPath': 'assets/icons/Social worler.png',
  },
  {
    'specialisty': 'Special Ed Lawyer',
    'imgPath': 'assets/icons/lawyer.png',
  },
  {
    'specialisty': 'Special Ed Teacher',
    'imgPath': 'assets/icons/teacher.png',
  },
  {
    'specialisty': 'Teaching Assistant',
    'imgPath': 'assets/icons/teaching.png',
  },
  {
    'specialisty': 'Speech Therapist',
    'imgPath': 'assets/icons/speech therapist.png',
  },
];

class Therapist {
  final String name;
  final bool isMale;
  final String specialisty;
  List<int> reviews;
  int startRate;
  bool isReview = false;
  Therapist({
    @required this.isReview,
    @required this.name,
    @required this.isMale,
    @required this.specialisty,
    @required this.reviews,
    @required this.startRate,
  });
}

class Appointment {
  final Therapist therapist;
  final DateTime dateTime;
  final Patient patient;

  Appointment({
    @required this.therapist,
    @required this.dateTime,
    @required this.patient,
  });
}

class Examination {
  final DateTime dataTime;
  final String title;

  Examination({@required this.dataTime, @required this.title});
}

class Test {
  final DateTime dataTime;
  final String title;

  Test({@required this.dataTime, @required this.title});
}

class Prescription {
  final String title;
  final DateTime givenDate;
  final Therapist therapist;
  Prescription({
    @required this.title,
    @required this.givenDate,
    @required this.therapist,
  });
}

class Message {
  final User sender;
  final String message;
  final User reciever;
  final DateTime sentDateTime;
  final MessageType messageType;
  MessageStatus status;

  Message({
    @required this.messageType,
    @required this.reciever,
    @required this.sender,
    @required this.message,
    @required this.sentDateTime,
    @required this.status,
  });
}

class Conversation {
  List<Message> messagesList;
  final User sender;
  final User reciever;

  Conversation({
    @required this.messagesList,
    @required this.sender,
    @required this.reciever,
  });
}

class User {
  final String name;
  final String username;
  final Gender gender;
  final bool isOnline;
  User({
    @required this.name,
    @required this.username,
    @required this.gender,
    @required this.isOnline,
  });
}

class Review {
  final String patientName, review, imgPath;
  final DateTime dateTime;
  final int rating;

  Review({
    @required this.patientName,
    @required this.review,
    @required this.imgPath,
    @required this.dateTime,
    @required this.rating,
  });
}

class CardModel {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  CardModel(
      {this.cardNumber, this.expiryDate, this.cardHolderName, this.cvvCode});
}

class Service {
  final String title, description, category, imgPath;
  final double price;
  final int time;
  Service({
    @required this.title,
    @required this.description,
    @required this.category,
    @required this.price,
    @required this.time,
    @required this.imgPath,
  });
}

class Notification {
  final String title, subtitle, timeAgo;
  final Color color;
  Notification({
    @required this.title,
    @required this.subtitle,
    @required this.timeAgo,
    @required this.color,
  });
}

List<Notification> notificationList = [
  Notification(
      title: "Credit Card Expired",
      subtitle: "Your credit card has expired.",
      color: Colors.redAccent[200],
      timeAgo: '12 hour ago'),
  Notification(
      title: "Credit Card Added",
      subtitle: "Your credit card has added successfully.",
      color: Colors.greenAccent[200],
      timeAgo: '22 hour ago'),
  Notification(
      title: "Profile Updated",
      subtitle: "You have Updated profile successfully.",
      color: Colors.greenAccent[200],
      timeAgo: '12 hour ago'),
];

List<Service> serviceList = [
  Service(
    price: 50,
    category: therapistCategories[0]['specialisty'],
    description: 'Another service',
    time: 30,
    title: "30 minutes of Mindful",
    imgPath: therapistCategories[0]['imgPath'],
  ),
  Service(
    price: 50,
    category: therapistCategories[1]['specialisty'],
    description: 'Another service',
    time: 30,
    title: "30 minutes of Mindful",
    imgPath: therapistCategories[1]['imgPath'],
  ),
  Service(
    price: 50,
    category: therapistCategories[2]['specialisty'],
    description: 'Another service',
    time: 30,
    title: "30 minutes of Mindful",
    imgPath: therapistCategories[2]['imgPath'],
  ),
  Service(
    price: 50,
    category: therapistCategories[3]['specialisty'],
    description: 'Another service',
    time: 30,
    title: "30 minutes of Mindful",
    imgPath: therapistCategories[3]['imgPath'],
  ),
];

String loremIpusmPara =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

List myCards = [
  CardModel(
    cardNumber: "4111 1111 1111 1111",
    expiryDate: "07/24",
    cardHolderName: "Jonathan",
    cvvCode: "017",
  ),
  CardModel(
    cardNumber: "4111 4329 1111 4233",
    expiryDate: "12/28",
    cardHolderName: "Random Person",
    cvvCode: "127",
  ),
];

List<Review> reviewList = [
  Review(
    patientName: 'Usama Ashraf',
    review: loremIpusmPara,
    imgPath: 'assets/images/c5.jpg',
    dateTime: DateTime.utc(
      2021,
      05,
      12,
    ),
    rating: 4,
  ),
  Review(
    patientName: 'Usama Ashraf',
    review: loremIpusmPara,
    imgPath: 'assets/images/c5.jpg',
    dateTime: DateTime.utc(
      2021,
      05,
      12,
    ),
    rating: 4,
  ),
  Review(
    patientName: 'Usama Ashraf',
    review: loremIpusmPara,
    imgPath: 'assets/images/c5.jpg',
    dateTime: DateTime.utc(
      2021,
      05,
      12,
    ),
    rating: 4,
  ),
  Review(
    patientName: 'Usama Ashraf',
    review: loremIpusmPara,
    imgPath: 'assets/images/c5.jpg',
    dateTime: DateTime.utc(
      2021,
      05,
      12,
    ),
    rating: 4,
  ),
];

List<User> userList = [
  User(
    name: 'John',
    gender: Gender.Male,
    username: 'ammyhere',
    isOnline: true,
  ),
  User(
    name: 'Tawfiq Rehmani',
    gender: Gender.Male,
    username: 'tawfiq',
    isOnline: false,
  ),
  User(
    name: 'Limsa Urona',
    gender: Gender.Female,
    username: 'limsa',
    isOnline: true,
  ),
  User(
    name: 'Khurain Zoe',
    gender: Gender.Male,
    username: 'zoe_tr',
    isOnline: false,
  ),
];

List<Conversation> conversationsList = [
  Conversation(
    sender: userList[1],
    reciever: userList[0],
    messagesList: messagesList.sublist(0, 2),
  ),
  Conversation(
    sender: userList[2],
    reciever: userList[0],
    messagesList: messagesList.sublist(0, 3),
  ),
  Conversation(
    sender: userList[3],
    reciever: userList[0],
    messagesList: messagesList.sublist(0, 5),
  ),
];

List<Message> messagesList = [
  Message(
    sender: userList[1],
    reciever: userList[0],
    message: 'Hy',
    sentDateTime: DateTime.utc(2021, 05, 20, 02, 30),
    status: MessageStatus.Seen,
    messageType: MessageType.Text,
  ),
  Message(
    sender: userList[1],
    reciever: userList[0],
    messageType: MessageType.Text,
    message:
        'In publishing and graphic text commonly used to demonstrate the visual form?',
    sentDateTime: DateTime.utc(2021, 05, 20, 03, 32),
    status: MessageStatus.Seen,
  ),
  Message(
    sender: userList[1],
    reciever: userList[0],
    messageType: MessageType.Text,
    message: 'let me know when you are free...',
    sentDateTime: DateTime.utc(2021, 05, 20, 04, 45),
    status: MessageStatus.Delivered,
  ),
  Message(
    sender: userList[0],
    messageType: MessageType.Text,
    reciever: userList[1],
    message:
        'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form',
    sentDateTime: DateTime.utc(2021, 05, 20, 05, 30),
    status: MessageStatus.Delivered,
  ),
  Message(
    sender: userList[0],
    reciever: userList[1],
    messageType: MessageType.Text,
    message: 'I will come at your place...',
    sentDateTime: DateTime.utc(2021, 05, 21, 06, 30),
    status: MessageStatus.Delivered,
  ),
  Message(
    sender: userList[1],
    reciever: userList[0],
    messageType: MessageType.File,
    message: 'assets/files/sample.pdf',
    sentDateTime: DateTime.utc(2021, 05, 21, 09, 30),
    status: MessageStatus.Seen,
  ),
  Message(
    sender: userList[1],
    reciever: userList[0],
    messageType: MessageType.Media,
    message: 'assets/images/a.jpg',
    sentDateTime: DateTime.utc(2021, 05, 21, 10, 32),
    status: MessageStatus.Seen,
  ),
  Message(
    sender: userList[1],
    reciever: userList[0],
    messageType: MessageType.Media,
    message: 'assets/videos/cave.mp4',
    sentDateTime: DateTime.utc(2021, 05, 21, 11, 32),
    status: MessageStatus.Seen,
  ),
];

List<Prescription> prescriptionList = [
  Prescription(
      title: "Tuberculosis Recipe",
      givenDate: DateTime.utc(2021, 06, 10, 11, 30),
      therapist: therapistList[0]),
  Prescription(
      title: "Pharyngits Recipe",
      givenDate: DateTime.utc(2021, 06, 12, 11, 30),
      therapist: therapistList[1]),
];

List<Examination> examinationList = [
  Examination(dataTime: DateTime.utc(2021, 06, 10, 11, 30), title: "Physical"),
  Examination(dataTime: DateTime.utc(2021, 06, 12, 09, 30), title: "MRI"),
];

List<Test> testList = [
  Test(
      dataTime: DateTime.utc(2021, 06, 10, 11, 30),
      title: "Monthly Medical Checkup"),
  Test(
      dataTime: DateTime.utc(2021, 06, 12, 09, 30),
      title: "Monthly Medical Checkup"),
];

List<Therapist> therapistList = [
  Therapist(
    isReview: false,
    isMale: true,
    startRate: 90,
    name: "Nabi Bakhs",
    specialisty: "Cardiologist",
    reviews: [4, 4, 5, 5, 5, 4, 5, 5, 4, 5, 5, 5, 5, 5, 5, 4, 5, 4, 5],
  ),
  Therapist(
    isReview: false,
    startRate: 100,
    isMale: false,
    name: "Rukhsana BiBi",
    specialisty: "Therapist",
    reviews: [4, 4, 5, 5, 5, 4, 5, 5, 4, 4, 5],
  ),
  Therapist(
    isReview: false,
    startRate: 80,
    isMale: true,
    name: "Nabi Bakhs",
    specialisty: "Cardiologist",
    reviews: [4, 4, 5, 5, 5, 4, 5, 5, 4, 5, 5, 5, 5, 5, 5, 4, 5, 4, 5],
  ),
  Therapist(
    isReview: false,
    startRate: 110,
    isMale: false,
    name: "Rukhsana BiBi",
    specialisty: "Therapist",
    reviews: [4, 4, 5, 5, 5, 4, 5, 5, 4, 4, 5],
  ),
];

List<Patient> patientList = [
  Patient(
    name: "John Ray",
    gender: "Male",
    maritalStatus: 'Single',
  ),
  Patient(
    name: "John Ray",
    gender: "Male",
    maritalStatus: 'Single',
  ),
  Patient(
    name: "John Ray",
    gender: "Male",
    maritalStatus: 'Single',
  ),
];

List<Appointment> appointmentList = [
  Appointment(
    therapist: therapistList[0],
    dateTime: DateTime.utc(2021, 05, 10, 11, 30),
    patient: patientList[0],
  ),
  Appointment(
    therapist: therapistList[1],
    dateTime: DateTime.utc(2021, 05, 12, 11, 30),
    patient: patientList[0],
  ),
  Appointment(
    therapist: therapistList[0],
    patient: patientList[0],
    dateTime: DateTime.utc(2021, 06, 28, 11, 30),
  ),
  Appointment(
    therapist: therapistList[1],
    dateTime: DateTime.utc(2021, 06, 29, 11, 30),
    patient: patientList[0],
  ),
];

/// DropDown Data
Map<String, Map<String, dynamic>> dropDownData = {
  'service_time': {
    'value': '30',
    'list': [
      '15',
      '30',
      '45',
      '60',
      '90',
      '120',
    ],
  },
  'service_type': {
    'value': 'AQUATIC\nTHERAPY',
    'list': [
      'AQUATIC\nTHERAPY',
      'Audiologist',
      'BCBA',
      'Dance\nTherapist',
      'Dietician',
      'Dir Floortime\nspecialist',
      'Feeding\nTherapist',
      'Horse\nTherapy',
      'Lactation\nConsultant',
      'Music\nTherapist',
      'Occupational\nTherapist',
      'P3',
      'Para',
      'PET\nTherapy',
      'Physical\nTherapist',
      'Psychologist',
      'Recreational\nTherapist',
      'Social\nWorker',
      'Special Ed\nLawyer',
      'Special Ed\nTeacher',
      'Teaching\nAssistant',
      'SpeechTherapist',
    ],
  },
  'provider_type': {
    'value': 'Individual',
    'list': [
      'Individual',
      'Company',
    ],
  },
  'therapist_categories': {
    'value': 'Mental Health',
    'list': [
      'Mental Health',
      'Eye Spacialist',
      'Homeopathy',
      'Dental Care',
      'Child Specialist',
      'Skin & Hair',
    ],
  },
  'gender': {
    'value': 'Male',
    'list': [
      'Male',
      'Female',
    ],
  },
  'bloodgroup': {
    'value': 'AB+',
    'list': [
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-',
    ],
  },
  'maritalstatus': {
    'value': 'Single',
    'list': [
      'Single',
      'Married',
      'Divorced',
    ],
  },
};

List<DateTime> timeSlotList = [
  DateTime.utc(2021, 05, 29, 08),
  DateTime.utc(2021, 05, 29, 09),
  DateTime.utc(2021, 05, 29, 10),
  DateTime.utc(2021, 05, 29, 12),
  DateTime.utc(2021, 05, 29, 14),
  DateTime.utc(2021, 05, 29, 15, 30),
  DateTime.utc(2021, 05, 29, 16, 20),
  DateTime.utc(2021, 05, 29, 17, 30),
  DateTime.utc(2021, 05, 29, 18),
  DateTime.utc(2021, 05, 29, 19),
];
