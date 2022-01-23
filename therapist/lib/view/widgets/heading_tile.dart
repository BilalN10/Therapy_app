import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class GreyHeadingTile extends StatelessWidget {
  const GreyHeadingTile({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: kDefaultPadding * 0.5),
      height: 55,
      width: SizeConfig.screenWidth,
      color: Colors.grey[200],
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
