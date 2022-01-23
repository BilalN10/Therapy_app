import 'package:flutter/material.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/utils.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/therapist_time_slot_page.dart';
import 'package:therapist/view/pages/ThPages/My_Patient/my_patient_details_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/appointment_tile.dart';
import 'package:therapist/view/widgets/input_field.dart';
import 'package:therapist/view/widgets/medium_button.dart';
import 'package:therapist/view/widgets/mini_button.dart';
import 'package:therapist/view/widgets/tab_bar.dart';

class MyAppointmentsPage extends StatefulWidget {
  final bool isThrapist;
  const MyAppointmentsPage({this.isThrapist});
  @override
  _MyAppointmentsPageState createState() => _MyAppointmentsPageState();
}

class _MyAppointmentsPageState extends State<MyAppointmentsPage> {
  int _selectedTab = 0;

  List<String> tabs = [
    'Upcoming',
    'History',
  ];

  @override
  Widget build(BuildContext context) {
    final List _appointmentList = appointmentList.where((a) {
      return _selectedTab == 1
          ? Utils.calculateDateDifference(a.dateTime) <= 0
          : Utils.calculateDateDifference(a.dateTime) < 0;
    }).toList();

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: kPrimaryColor,
          ),
          elevation: 1,
          backgroundColor: kAppBarBGColor,
          title: Text(
            "My Appointments",
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: kAppBarTitleSize,
                ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(
            top: kDefaultPadding * 0.5,
          ),
          child: Column(
            children: [
              MyTabBar(
                selectedTab: _selectedTab,
                tabs: tabs,
                onItemPressed: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _appointmentList.length - 2,
                    itemBuilder: (BuildContext context, int index) {
                      print("Appointment Length is ${_appointmentList.length}");
                      final Appointment _appointment = _appointmentList[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: kDefaultPadding * 0.75),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const MyPatientDetailsPage());
                          },
                          child: AppointmentTile(
                            index: _selectedTab,
                            isTh: widget.isThrapist,
                            showChat: true,
                            appointment: _appointment,
                            topButton: _selectedTab == 0
                                ? MiniButton(
                                    label: 'Edit',
                                    onTap: () {},
                                  )
                                : _appointment.therapist.isReview
                                    ? const Icon(
                                        Icons.check_circle_sharp,
                                        color: Colors.white,
                                      )
                                    : MiniButton(
                                        label: 'Review',
                                        onTap: () {
                                          // _showMyDialog();
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible:
                                                false, // user must tap button!
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Review'),
                                                content: SingleChildScrollView(
                                                  child: InputField(
                                                    // textInputType: TextInputType.text,
                                                    validator: (val) {
                                                      if (val.isEmpty ||
                                                          val == null)
                                                        return 'Required';
                                                      else
                                                        return null;
                                                    },
                                                    hint: 'Enter your review',
                                                    label: 'Enter your review',
                                                    controller: null,
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Send'),
                                                    onPressed: () {
                                                      setState(() {
                                                        _appointment.therapist
                                                            .isReview = true;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          // Get.defaultDialog(
                                          //     title: "Review",
                                          //     actions: [
                                          //       Expanded(
                                          //         child: InputField(
                                          //           textInputType:
                                          //               TextInputType.number,
                                          //           validator: (val) {
                                          //             if (val.isEmpty ||
                                          //                 val == null)
                                          //               return 'Required';
                                          //             else
                                          //               return null;
                                          //           },
                                          //           hint: 'Service Price',
                                          //           label: 'Service Price',
                                          //           controller: null,
                                          //         ),
                                          //       ),
                                          //     ]);

                                          // Get.to(
                                          //   () => TherapistTimeSlot(),
                                          // );
                                        },
                                      ),
                            bottomButton: _selectedTab == 0
                                ? MiniButton(
                                    bgColor: Colors.redAccent,
                                    txtColor: Colors.white,
                                    label: 'Cancel',
                                    onTap: () {},
                                  )
                                : null,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Review'),
          content: SingleChildScrollView(
            child: InputField(
              // textInputType: TextInputType.text,
              validator: (val) {
                if (val.isEmpty || val == null)
                  return 'Required';
                else
                  return null;
              },
              hint: 'Enter your review',
              label: 'Enter your review',
              controller: null,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Send'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
