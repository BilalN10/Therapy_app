import 'package:flutter/material.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/widgets/mytherapist_tile.dart';
import 'package:therapist/view/size_config.dart';

class MyTherapistsPage extends StatelessWidget {
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
          "My Therapist List",
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
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Scrollbar(
          child: ListView.builder(
              itemCount: therapistList.length,
              itemBuilder: (BuildContext context, int index) {
                final _therapist = therapistList[index];
                return MyTherapistTile(
                  therapist: _therapist,
                );
              }),
        ),
      ),
    );
  }
}
