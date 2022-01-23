import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/CommonPages/Settings/components/setting_button.dart';
import 'package:therapist/view/pages/CommonPages/Settings/language_setting_page.dart';
import 'package:therapist/view/pages/CommonPages/Settings/notification_settings_page.dart';
import 'package:therapist/view/pages/CommonPages/Subscription/subscription_detail_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isHealthTipsOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "Settings",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: kDefaultPadding * 0.5),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Health Tips",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              subtitle: const Text('Get Health tips for your health lifestyle'),
              trailing: Switch(
                activeColor: kPrimaryColor,
                value: isHealthTipsOn,
                onChanged: (v) {
                  setState(() {
                    isHealthTipsOn = !isHealthTipsOn;
                  });
                },
              ),
            ),
            SettingButton(
                onTap: () {
                  Get.to(
                    NotificationSettingPage(),
                  );
                },
                label: 'Notification Settings'),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "General",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.grey,
                  ),
            ),
            SettingButton(
                onTap: () {
                  Get.to(
                    LanguageSettingPage(),
                  );
                },
                label: 'Language'),
            SettingButton(
                onTap: () {
                  Get.to(
                    () => SubscriptionDetailPage(),
                  );
                },
                label: 'Subscription Details'),
            SettingButton(onTap: () {}, label: 'About MedAPP'),
            SettingButton(onTap: () {}, label: 'Privacy Policy'),
            SettingButton(onTap: () {}, label: 'Help and Support'),
            SettingButton(onTap: () {}, label: 'Rate MedAPP'),
            SettingButton(onTap: () {}, label: 'Invite Friends'),
          ],
        ),
      ),
    );
  }
}
