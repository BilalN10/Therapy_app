import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image,
          height: SizeConfig.screenHeight * 0.35,
          width: SizeConfig.screenWidth * 1,
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Text(
          'Welcome & Greetings',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: kDefaultPadding * 0.5,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
