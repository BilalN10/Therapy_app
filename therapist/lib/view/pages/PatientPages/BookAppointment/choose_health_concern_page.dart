import 'package:flutter/material.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/choose_therapist_page.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/components/heatlh_concern_selector.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/my_button.dart';

class ChooseHealthConcernPage extends StatefulWidget {
  const ChooseHealthConcernPage({Key key}) : super(key: key);

  @override
  _ChooseHealthConcernPageState createState() =>
      _ChooseHealthConcernPageState();
}

class _ChooseHealthConcernPageState extends State<ChooseHealthConcernPage> {
  int _selectedIndex = 0;

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
          "Book Appointment",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: kAppBarTitleSize,
              ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 28,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.search),
        //   ),
        // ],
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                  horizontal: kDefaultPadding,
                ),
                child: Text(
                  "Choose a Health Concern",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                itemCount: therapistCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 1,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return HealthConcernSelector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    imgPath: therapistCategories[index]['imgPath'],
                    specialisty: therapistCategories[index]['specialisty'],
                    selected: _selectedIndex == index,
                  );
                },
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            MyButton(
              label: 'Continue',
              onTap: () {
                Get.to(
                  () => ChooseTherapistPage(),
                );
              },
            ),
            const SizedBox(height: kDefaultPadding),
          ],
        ),
      ),
    );
  }
}
