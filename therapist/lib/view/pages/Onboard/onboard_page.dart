import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/Onboard/components/content.dart';
import 'package:therapist/view/pages/Welcome/welcome_page.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:get/get.dart';
import '../../size_config.dart';

class OnboardPage extends StatefulWidget {
  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/ill.png",
      "text": "An ultimate directory for therapist providers.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: getRelativeHeight(0.07),
              ),
              Text(
                "CentraTherapy",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: getRelativeHeight(0.07),
              ),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => OnboardContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: List.generate(
                      //     splashData.length,
                      //     (index) => buildDot(index: index),
                      //   ),
                      // ),
                      const Spacer(flex: 2),
                      MyButton(
                        onTap: () {
                          Get.off(() => WelcomePage());
                        },
                        label: 'Continue',
                      ),
                      SizedBox(
                        height: getRelativeHeight(0.07),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // AnimatedContainer buildDot({int index}) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 200),
  //     margin: const EdgeInsets.only(right: 5),
  //     height: 6,
  //     width: currentPage == index ? 20 : 6,
  //     decoration: BoxDecoration(
  //       color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
  //       borderRadius: BorderRadius.circular(3),
  //     ),
  //   );
  // }
}
