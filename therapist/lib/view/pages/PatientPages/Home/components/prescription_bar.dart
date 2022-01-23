import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/mini_tile.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/visited_therapist_bar.dart';

class PrescriptionBar extends StatelessWidget {
  const PrescriptionBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarHeader(
          title: "Your Prescriptions",
          onTap: () {},
        ),
        const SizedBox(
          height: kDefaultPadding * 0.75,
        ),
        MiniTile(
          onTap: () {},
          title: "Tuberculosis Recipe",
          subTitle: "Given by Shbana BiBi",
          svgPath: 'assets/images/medical-prescription.svg',
        ),
      ],
    );
  }
}
