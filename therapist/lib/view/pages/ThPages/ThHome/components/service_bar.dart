import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/Home/components/visited_therapist_bar.dart';
import 'package:therapist/view/pages/ThPages/ThHome/components/edit_services_screen.dart';
import 'package:therapist/view/pages/ThPages/ThHome/components/services_details_page.dart';

class ServicesBar extends StatelessWidget {
  const ServicesBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BarHeader(
          title: "Services",
          onTap: () {
            Get.to(
              () => ServicesDetailsPage(),
            );
          },
        ),
        const SizedBox(
          height: kDefaultPadding * 0.75,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          itemCount: serviceList.length + 1,
          itemBuilder: (BuildContext context, int index) =>
              index < serviceList.length
                  ? ServiceTile(
                      service: serviceList[index],
                    )
                  : const SizedBox(height: kDefaultPadding * 3),
        ),
      ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    Key key,
    @required this.service,
  }) : super(key: key);

  final Service service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 0.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100],
              offset: const Offset(0, 1),
              blurRadius: 5,
            ),
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[200],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  service.imgPath,
                  height: 50,
                ),
              ),
            ),
            const SizedBox(
              width: kDefaultPadding * 0.75,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  service.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "\$" +
                      service.price.toString() +
                      " / " +
                      service.time.toString() +
                      ' min',
                  style: Theme.of(context).textTheme.overline,
                ),
              ],
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              Get.to(
                  EditServicesScreen(
                    description: service.description,
                    price: service.price,
                    time: service.time.toString(),
                    title: service.title,
                  ),
                  fullscreenDialog: true);
            },
            child: const Text("Edit"))
      ]),
    );
  }
}
