import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:therapist/model/data.dart';
import 'package:therapist/utils.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/visited_therpist_grid.dart';
import 'package:therapist/view/pages/ThPages/ThDetails/th_details_page.dart';
import 'package:therapist/view/size_config.dart';

class VisitedTherapistsBar extends StatelessWidget {
  const VisitedTherapistsBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarHeader(
          title: "Visited Therapists",
          onTap: () {
            Get.to(
              () => VisitTherapistGridPage(),
            );
          },
        ),
        const SizedBox(
          height: kDefaultPadding * 0.75,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
          child: Row(
            children: [
              TherapistTile(
                therapist: therapistList[0],
              ),
              const Spacer(),
              TherapistTile(
                therapist: therapistList[1],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BarHeader extends StatelessWidget {
  const BarHeader({
    Key key,
    @required this.onTap,
    @required this.title,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Text(
              "See All",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}

class TherapistTile extends StatelessWidget {
  const TherapistTile({
    Key key,
    @required this.therapist,
  }) : super(key: key);

  final Therapist therapist;

  @override
  Widget build(BuildContext context) {
    final avg = Utils.calculateAverage(therapist.reviews);
    return GestureDetector(
      onTap: () {
        Get.to(() => ThDetailsPage());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.25),
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60,
                    width: SizeConfig.screenWidth * 0.435,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kBorderRadius),
                        topLeft: Radius.circular(kBorderRadius),
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     blurRadius: 25,
                      //     offset: Offset(0, 5),
                      //     color: kPrimaryColor.withOpacity(0.75),
                      //   ),
                      // ],
                      color: kPrimaryColor,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: -6,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white.withOpacity(0.15),
                    ),
                  ),
                  SvgPicture.asset(
                    therapist.isMale
                        ? 'assets/images/dr_m.svg'
                        : 'assets/images/dr_f.svg',
                    height: 80,
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.435,
              padding: const EdgeInsets.all(kDefaultPadding * 0.5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(kBorderRadius),
                  bottomRight: Radius.circular(kBorderRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    offset: const Offset(0, 5),
                    color: Colors.grey[300].withOpacity(0.75),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Th ${therapist.name}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    therapist.specialisty,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      for (int i = 1; i <= 5; i++)
                        Icon(Icons.star,
                            size: 12,
                            color: i <= avg ? Colors.amber : Colors.grey),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "(${therapist.reviews.length} Reviews)",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 8, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
