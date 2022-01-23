import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/next_appointment_bar.dart';
import 'package:therapist/view/pages/ThPages/ThHome/components/service_bar.dart';
import 'package:therapist/view/pages/ThPages/ThProfile/th_profile_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:get/get.dart';

class ThHomePage extends StatelessWidget {
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
                CompleteProfileButton(),
                const SizedBox(
                  height: kDefaultPadding * 1.5,
                ),
                NextAppointmentBar(
                  isTherapist: true,
                ),
                const SizedBox(
                  height: kDefaultPadding * 1.5,
                ),
                ServicesBar(),
                const SizedBox(
                  height: kDefaultPadding * 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteProfileButton extends StatelessWidget {
  const CompleteProfileButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const ThProfilePage(editProfile: true),
        );
      },
      child: Container(
        color: Colors.redAccent[200],
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 0.5,
        ),
        // height: 30,
        width: SizeConfig.screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Complete Your Profile',
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.white,
                  ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
