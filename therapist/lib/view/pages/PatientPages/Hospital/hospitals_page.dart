import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';

class HospitalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        elevation: 1,
        backgroundColor: kAppBarBGColor,
        title: Text(
          "Hospitals",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
