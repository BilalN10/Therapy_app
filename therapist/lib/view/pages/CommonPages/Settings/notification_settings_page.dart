import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/check_box.dart';

class NotificationSettingPage extends StatefulWidget {
  @override
  _NotificationSettingPageState createState() =>
      _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  bool allNotifications = true;
  bool campainNoti = true;
  bool messageNoti = true;
  bool alertsNoti = true;
  bool appointmentNoti = true;
  bool healthTipsNoti = true;
  bool reminderRecordsNoti = true;
  bool updateOffersNoti = true;

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
          "Notification Settings",
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
      body: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "All Notifications",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                subtitle: const Text('Recive all notifications'),
                trailing: Switch(
                  activeColor: kPrimaryColor,
                  value: allNotifications,
                  onChanged: (v) {
                    allNotifications ? _disableAllNoti() : _enableAllNoti();
                  },
                ),
              ),
              CheckBox(
                title: 'Campain Messages',
                onChanged: (v) {
                  setState(() {
                    campainNoti = !campainNoti;
                    if (!campainNoti) allNotifications = false;
                  });
                },
                value: campainNoti,
              ),
              CheckBox(
                title: 'Coversation Messages',
                onChanged: (v) {
                  setState(() {
                    messageNoti = !messageNoti;
                    if (!messageNoti) allNotifications = false;
                  });
                },
                value: messageNoti,
              ),
              CheckBox(
                title: 'Alerts',
                onChanged: (v) {
                  setState(() {
                    alertsNoti = !alertsNoti;
                    if (!alertsNoti) allNotifications = false;
                  });
                },
                value: alertsNoti,
              ),
              CheckBox(
                title: 'Appointments',
                onChanged: (v) {
                  setState(() {
                    appointmentNoti = !appointmentNoti;
                    if (!appointmentNoti) allNotifications = false;
                  });
                },
                value: appointmentNoti,
              ),
              CheckBox(
                title: 'Health Tips',
                onChanged: (v) {
                  setState(() {
                    healthTipsNoti = !healthTipsNoti;
                    if (!healthTipsNoti) allNotifications = false;
                  });
                },
                value: healthTipsNoti,
              ),
              CheckBox(
                title: 'Reminder & Records',
                onChanged: (v) {
                  setState(() {
                    reminderRecordsNoti = !reminderRecordsNoti;
                    if (!reminderRecordsNoti) allNotifications = false;
                  });
                },
                value: reminderRecordsNoti,
              ),
              CheckBox(
                title: 'Update & Offers',
                onChanged: (v) {
                  setState(() {
                    updateOffersNoti = !updateOffersNoti;
                    if (!updateOffersNoti) allNotifications = false;
                  });
                },
                value: updateOffersNoti,
              ),
            ],
          )),
    );
  }

  void _enableAllNoti() {
    setState(() {
      allNotifications = true;
      campainNoti = true;
      messageNoti = true;
      alertsNoti = true;
      appointmentNoti = true;
      healthTipsNoti = true;
      reminderRecordsNoti = true;
      updateOffersNoti = true;
    });
  }

  void _disableAllNoti() {
    setState(() {
      allNotifications = false;
      campainNoti = false;
      messageNoti = false;
      alertsNoti = false;
      appointmentNoti = false;
      healthTipsNoti = false;
      reminderRecordsNoti = false;
      updateOffersNoti = false;
    });
  }
}
