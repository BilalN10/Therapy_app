import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/CommonPages/Signin/signin_page.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:get/get.dart';
import '../../size_config.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Text(
                  "Welcome!",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            SizedBox(
              height: getRelativeHeight(0.3),
              child: Image.asset(
                'assets/images/ill.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            MyButton(
              label: 'Continue as Therapist',
              onTap: () {
                Get.off(
                  () => SigninPage(
                    isTherapist: true,
                  ),
                );
              },
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: const Text('or'),
            ),
            MyButton(
              label: 'Looking for Services',
              onTap: () {
                Get.off(
                  () => SigninPage(
                    isTherapist: false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
