import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapist/view/constants.dart';

class MiniTile extends StatelessWidget {
  const MiniTile({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.svgPath,
    @required this.onTap,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String svgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300].withOpacity(0.75),
                offset: const Offset(0, 5),
                blurRadius: 25,
              )
            ]),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              height: 36,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
