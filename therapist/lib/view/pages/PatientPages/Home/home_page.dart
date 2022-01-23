import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/greeting_bar.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/next_appointment_bar.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/visited_therapist_bar.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/search_bar.dart';
import 'package:therapist/view/size_config.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                const SizedBox(
                  height: kDefaultPadding * 1.5,
                ),
                GreetingBar(),
                const SizedBox(
                  height: kDefaultPadding * 1.5,
                ),
                SearchBar(),
                const SizedBox(
                  height: kDefaultPadding * 1.5,
                ),
                NextAppointmentBar(),
                const SizedBox(
                  height: kDefaultPadding * 1.5,
                ),
                VisitedTherapistsBar(),
                // const SizedBox(
                //   height: kDefaultPadding * 1.5,
                // ),
                // PrescriptionBar(),
                // const SizedBox(
                //   height: kDefaultPadding * 1.5,
                // ),
                // TestResultBar(),
                // const SizedBox(
                //   height: kDefaultPadding * 6,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
