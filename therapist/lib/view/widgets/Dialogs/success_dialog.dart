import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';
import 'package:get/get.dart';

class Dialogs {
  static dynamic signupDialog(BuildContext context) {
    return Get.defaultDialog(
      radius: kBorderRadius,
      title: 'Signed Up Successfully',
      content: Column(
        children: [
          const SizedBox(height: kDefaultPadding),
          SizedBox(
            height: getRelativeHeight(0.2),
            child: Image.asset('assets/images/signup.png'),
          ),
          const SizedBox(height: kDefaultPadding),
          const Text(
            'You have successfully signed up with yourmail@exampl.com',
          ),
          const SizedBox(height: kDefaultPadding * 0.5),
        ],
      ),
    );
  }

  static dynamic snackBar({
    @required String title,
    @required String subTitle,
    Color bgColor,
  }) {
    return Get.snackbar(
      title,
      subTitle,
      backgroundColor: bgColor ?? Colors.grey[200],
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
