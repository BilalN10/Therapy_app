import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class PatientReviewTile extends StatelessWidget {
  const PatientReviewTile({
    Key key,
    @required this.review,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(review.imgPath),
          ),
          const SizedBox(width: kDefaultPadding * 0.5),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(
                  review.patientName,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  color: kPrimaryColor,
                  size: 20,
                ),
                Text(
                  review.rating.toString(),
                ),
              ]),
              const SizedBox(height: 8),
              Text(
                review.review,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat.yMMMEd().format(review.dateTime),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
