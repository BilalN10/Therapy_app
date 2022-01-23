import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapist/view/constants.dart';

class GreetingBar extends StatelessWidget {
  const GreetingBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/waving-hand.svg',
            height: 36,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello Jack", style: Theme.of(context).textTheme.headline6),
              Text(
                "How are you feeling today?",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
