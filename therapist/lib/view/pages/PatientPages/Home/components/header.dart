import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Medicare Hospital (pvt) Ltd.',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: .3 * kDefaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.grey[400],
              size: 15,
            ),
            const SizedBox(width: .1 * kDefaultPadding),
            Text(
              '62 A Abdali Rd, Altaf Town, Multan, Punjab',
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
