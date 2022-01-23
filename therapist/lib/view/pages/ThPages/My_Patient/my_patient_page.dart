import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/model/models/my_patient_model.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/mini_button.dart';

import 'my_patient_details_page.dart';

class MyPatientPage extends StatelessWidget {
  const MyPatientPage({Key key}) : super(key: key);

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
          "My Patient List",
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
              itemCount: patientModelList.length,
              itemBuilder: (BuildContext context, int index) {
                final _patient = patientModelList[index];
                return Container(
                  margin: const EdgeInsets.only(top: kDefaultPadding),
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                    horizontal: kDefaultPadding * 0.5,
                  ),
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey[200],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            _patient.imgPath,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: kDefaultPadding * 0.5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _patient.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                          ),
                          Text(
                            _patient.disease,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          MiniButton(
                            label: "Details",
                            onTap: () {
                              Get.to(() => const MyPatientDetailsPage());
                            },
                            txtColor: Colors.white,
                            bgColor: kPrimaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
