import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/model/data.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        elevation: 1,
        backgroundColor: kAppBarBGColor,
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: kAppBarTitleSize,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Scrollbar(
          radius: const Radius.circular(kBorderRadius),
          child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (BuildContext context, int index) {
              final _notification = notificationList[index];
              return Container(
                //width: SizeConfig.screenWidth,

                margin: const EdgeInsets.only(
                  top: kDefaultPadding * 0.75,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      // flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _notification.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            _notification.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding * 0.5),
                    Text(
                      _notification.timeAgo,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontSize: 10,
                          ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
