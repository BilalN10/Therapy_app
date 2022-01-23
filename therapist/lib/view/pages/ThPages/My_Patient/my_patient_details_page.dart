import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/ThPages/ThDetails/components/stat_counter.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/medium_button.dart';
import 'package:therapist/view/widgets/mini_button.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:therapist/view/widgets/profile_header.dart';

class MyPatientDetailsPage extends StatelessWidget {
  const MyPatientDetailsPage({Key key}) : super(key: key);

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
          "Patient",
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
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            ProfileHeader(
              name: "Sophia",
              imgPath: "assets/images/girl.png",
              subtitle: "iamjohn@yahoo.com",
              widget: Row(children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 18,
                ),
                Text(
                  "Rahim Yar Khan",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ]),
            ),
            const SizedBox(height: 2 * kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const StatCounter(
                  icon: Icons.watch_later,
                  title: 'Appoint Time',
                  subtitle: 'Till 7:00 pm',
                  iconColor: kPrimaryColor,
                ),
                Container(
                  height: 40,
                  width: 1,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                      kBorderRadius,
                    ),
                  ),
                ),
                const StatCounter(
                  icon: Icons.medical_services,
                  title: 'OT/PT',
                  subtitle: 'OT/PT',
                  iconColor: Colors.amber,
                ),
                Container(
                  height: 40,
                  width: 1,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                      kBorderRadius,
                    ),
                  ),
                ),
                const StatCounter(
                  icon: Icons.person,
                  title: '62',
                  subtitle: 'Patients Age',
                  iconColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const StatCounter(
                  icon: Icons.person_outline_outlined,
                  title: 'Male',
                  subtitle: 'Gender',
                  iconColor: Colors.orange,
                ),
                Container(
                  height: 40,
                  width: 1,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                      kBorderRadius,
                    ),
                  ),
                ),
                const StatCounter(
                  icon: Icons.local_hospital,
                  title: '12-4-2021',
                  subtitle: 'Last Visited',
                  iconColor: Colors.amberAccent,
                ),
                Container(
                  height: 40,
                  width: 1,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(
                      kBorderRadius,
                    ),
                  ),
                ),
                const StatCounter(
                  icon: Icons.thermostat_outlined,
                  title: 'Critical',
                  subtitle: 'Condition',
                  iconColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 50),
            //MiniButton(label: "COnfirm", onTap: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 46,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 25,
                            offset: const Offset(0, 5),
                            color: Colors.red.withOpacity(0.40),
                          ),
                        ]),
                    // decoration: BoxDecoration(
                    //   color: Colors.red,
                    //   borderRadius: BorderRadius.circular(kBorderRadius),
                    // ),
                    child: Text("Cancel",
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.white,
                            )),
                  ),
                ),
                MediumButton(
                  label: "Confirm",
                  onTap: () {},
                  width: 150,
                ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: kDefaultPadding * 2,
            //     left: kDefaultPadding,
            //     right: kDefaultPadding,
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Verified Patients Reviews",
            //         style: Theme.of(context).textTheme.subtitle2.copyWith(
            //               color: Colors.grey,
            //             ),
            //       ),
            //       const Spacer(),
            //       const Icon(
            //         Icons.star,
            //         color: Colors.amberAccent,
            //         size: 20,
            //       ),
            //       const Text('4.5'),
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: Scrollbar(
            //     radius: const Radius.circular(kBorderRadius),
            //     child: ListView.builder(
            //         // shrinkWrap: true,
            //         // physics: NeverScrollableScrollPhysics(),
            //         itemCount: reviewList.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           return PatientReviewTile(
            //             review: reviewList[index],
            //           );
            //         }),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
