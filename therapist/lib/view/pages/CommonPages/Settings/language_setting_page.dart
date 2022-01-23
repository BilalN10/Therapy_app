import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/radio_selector.dart';

class LanguageSettingPage extends StatefulWidget {
  @override
  _LanguageSettingPageState createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  final List<String> _languages = [
    'English',
    'Spanish',
    'Italian',
    'Portuguese',
  ];

  int _currentLanguage = 1;

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
          "Language Settings",
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
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            const SizedBox(height: kDefaultPadding),
            ..._languages
                .map(
                  (e) => RadioSelector(
                    title: e,
                    groupValue: 1,
                    onChanged: (v) {
                      setState(() {
                        _currentLanguage = _languages.indexOf(e);
                      });
                    },
                    radioValue:
                        _languages.indexOf(e) == _currentLanguage ? 1 : 0,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
