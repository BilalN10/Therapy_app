import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/utils.dart';
import 'package:therapist/view/constants.dart';

class AppointmentTile extends StatelessWidget {
  const AppointmentTile({
    @required this.appointment,
    this.showShadow = false,
    this.index,
    this.topButton,
    this.bottomButton,
    this.isTherapist = false,
    this.onTap,
    @required this.showChat,
    Key key,
    this.isTh,
  }) : super(key: key);
  final bool isTh;
  final bool showChat;
  final Appointment appointment;
  final bool showShadow, isTherapist;
  final Widget topButton, bottomButton;
  final Function onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: kPrimaryColor,
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    blurRadius: 25,
                    offset: const Offset(0, 5),
                    color: kPrimaryColor.withOpacity(0.75),
                  ),
                ]
              : null,
        ),
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.dateToString(appointment.dateTime),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      DateFormat.jm().format(appointment.dateTime) +
                          ", " +
                          DateFormat.yMMMMd().format(appointment.dateTime),
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                const Spacer(),
                const Spacer(),
                const Spacer(),
                const Spacer(),
                index == 1
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          // Get.to(
                          //   () => ,
                          // );
                        },
                        child: showChat
                            ? const Icon(
                                Icons.call_outlined,
                                color: Colors.white,
                                size: 25,
                              )
                            : const SizedBox(),
                      ),
                const Spacer(),
                // const Spacer(),
                //const Spacer(),

                index == 1
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          // Get.to(
                          //   () => ,
                          // );
                        },
                        child: showChat
                            ? const Icon(Icons.chat, color: Colors.white)
                            : const SizedBox(),
                      ),
                const Spacer(),
                isTherapist ? const SizedBox() : topButton ?? const SizedBox(),
              ],
            ),
            const Divider(
              color: Colors.white70,
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: isTh
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset("assets/images/girl.png"),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: isTherapist
                              ? CachedNetworkImage(
                                  imageUrl: appointment.patient.profileImageURL,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              : SvgPicture.asset(
                                  appointment.therapist.isMale
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
                      isTherapist
                          ? appointment.patient.name
                          : "Th ${appointment.therapist.name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    isTh
                        ? Text(
                            "Treatment for Periodontitis",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Colors.white),
                          )
                        : Text(
                            isTherapist
                                ? appointment.patient.gender +
                                    " - " +
                                    appointment.patient.maritalStatus
                                : "Family therapist, " +
                                    appointment.therapist.specialisty,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Colors.white),
                          ),
                  ],
                ),
                const Spacer(),
                bottomButton ?? const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
