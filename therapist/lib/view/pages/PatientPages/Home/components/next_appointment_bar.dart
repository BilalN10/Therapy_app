import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/therapist_time_slot_page.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/visited_therapist_bar.dart';
import 'package:therapist/view/pages/PatientPages/MyAppointment/myappointments_page.dart';
import 'package:therapist/view/pages/ThPages/My_Patient/my_patient_details_page.dart';
import 'package:therapist/view/widgets/appointment_tile.dart';
import 'package:get/get.dart';

class NextAppointmentBar extends StatelessWidget {
  const NextAppointmentBar({
    this.isTherapist = false,
    Key key,
  }) : super(key: key);

  final bool isTherapist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BarHeader(
          title: "Next Appointment",
          onTap: () {
            Get.to(
              () => const MyAppointmentsPage(
                isThrapist: true,
              ),
            );
          },
        ),
        const SizedBox(
          height: kDefaultPadding * 0.75,
        ),
        AppointmentTile(
          isTh: false,
          showChat: false,
          onTap: () {
            Get.to(
              () => const MyPatientDetailsPage(),
            );
          },
          appointment: appointmentList[0],
          showShadow: true,
          isTherapist: isTherapist,
          topButton: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Center(
              child: Icon(
                Icons.map,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
