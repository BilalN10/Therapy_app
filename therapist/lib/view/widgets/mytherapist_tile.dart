import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/utils.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/ThPages/ThDetails/th_details_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/mini_button.dart';
import 'package:get/get.dart';

class MyTherapistTile extends StatelessWidget {
  const MyTherapistTile({
    Key key,
    @required Therapist therapist,
    this.showRating = false,
    this.showRate = false,
    this.selected = false,
  })  : _therapist = therapist,
        super(key: key);

  final Therapist _therapist;
  final bool showRating, showRate, selected;

  @override
  Widget build(BuildContext context) {
    var avg = 0;
    if (showRating) {
      avg = Utils.calculateAverage(_therapist.reviews);
    }
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding * 0.5,
      ),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: selected ? kPrimaryColor : Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: selected ? Colors.white : Colors.grey[200],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SvgPicture.asset(
                _therapist.isMale
                    ? 'assets/images/dr_m.svg'
                    : 'assets/images/dr_f.svg',
              ),
            ),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _therapist.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                      color: selected ? Colors.white : Colors.black,
                    ),
              ),
              Text(
                _therapist.specialisty,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: selected ? Colors.white : Colors.black,
                    ),
              ),
              Text(
                'Family Therapist',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: selected ? Colors.white : Colors.black,
                    ),
              ),
              showRate
                  ? Text('Start from \$${_therapist.startRate}',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: selected ? Colors.white : Colors.black,
                          ))
                  : const SizedBox(),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              showRating
                  ? Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: selected ? Colors.amberAccent : kPrimaryColor,
                          size: 20,
                        ),
                        Text(
                          avg.toString(),
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: selected ? Colors.white : Colors.black,
                              ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              MiniButton(
                label: "Details",
                onTap: () {
                  Get.to(() => ThDetailsPage());
                },
                txtColor: selected ? kPrimaryColor : Colors.white,
                bgColor: selected ? Colors.white : kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
