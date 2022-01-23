import 'dart:async';

import 'package:flutter/material.dart';
import 'package:therapist/view/pages/Onboard/onboard_page.dart';

import '../../constants.dart';
import '../../size_config.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.off(
        () => OnboardPage(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CentraTherapy',
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              'Finding Therapy Made Easy!',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
