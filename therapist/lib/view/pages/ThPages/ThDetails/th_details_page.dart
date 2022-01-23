import 'package:flutter/material.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/therapist_time_slot_page.dart';
import 'package:therapist/view/pages/ThPages/ThDetails/components/patient_review_tile.dart';
import 'package:therapist/view/pages/ThPages/ThDetails/components/stat_counter.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:therapist/view/widgets/profile_header.dart';
import 'package:get/get.dart';

class ThDetailsPage extends StatelessWidget {
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
          "Therapist",
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
              name: "John ",
              imgPath: "assets/images/c5.jpg",
              subtitle: "iamjohn@yahoo.com",
              widget: Row(children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 18,
                ),
                Text(
                  "Max Hospital",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 4),
                Text(
                  'Main John road',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.grey),
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const StatCounter(
                  icon: Icons.watch_later,
                  title: 'Available',
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
                  icon: Icons.verified,
                  title: '12 Years',
                  subtitle: 'Experience',
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
                  title: '32K',
                  subtitle: 'Patients Treated',
                  iconColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: kDefaultPadding),
            MyButton(
              label: 'Book Appointment',
              onTap: () {
                Get.to(() => TherapistTimeSlot());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding * 2,
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Text(
                    "Verified Patients Reviews",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Colors.amberAccent,
                    size: 20,
                  ),
                  const Text('4.5'),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                radius: const Radius.circular(kBorderRadius),
                child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: reviewList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PatientReviewTile(
                        review: reviewList[index],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
