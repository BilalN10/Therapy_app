import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/widgets/mini_button.dart';

class TestTile extends StatelessWidget {
  const TestTile({
    Key key,
    @required this.test,
  }) : super(key: key);

  final Test test;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/medical-check.svg',
              height: 36,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  test.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(test.dataTime),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                MiniButton(
                  label: "See Report",
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
