import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/mini_tile.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/visited_therapist_bar.dart';

class TestResultBar extends StatelessWidget {
  const TestResultBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarHeader(
          title: "Test Results",
          onTap: () {},
        ),
        const SizedBox(
          height: kDefaultPadding * 0.75,
        ),
        MiniTile(
          onTap: () {},
          title: "Monthly Medical Check",
          subTitle: "1 January 2021",
          svgPath: 'assets/images/medical-check.svg',
        ),
      ],
    );
  }
}
