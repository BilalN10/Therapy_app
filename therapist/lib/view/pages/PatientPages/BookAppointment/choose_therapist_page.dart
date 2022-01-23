import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/filter_therpist_page.dart';
import 'package:therapist/view/pages/PatientPages/BookAppointment/therapist_time_slot_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/mytherapist_tile.dart';
import 'package:therapist/view/widgets/my_button.dart';

class ChooseTherapistPage extends StatefulWidget {
  @override
  _ChooseTherapistPageState createState() => _ChooseTherapistPageState();
}

class _ChooseTherapistPageState extends State<ChooseTherapistPage> {
  int _selectedIndex = -1;
  bool _anyTherapist = true;

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
          "Choose Therapist",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: kAppBarTitleSize,
              ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                FilterTherapistPage(),
              );
            },
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Any Available Therapist",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Checkbox(
                    value: _anyTherapist,
                    onChanged: (v) {
                      setState(() {
                        _anyTherapist = !_anyTherapist;
                        if (_anyTherapist)
                          _selectedIndex = -1;
                        else if (!_anyTherapist) _selectedIndex = 0;
                      });
                    },
                    activeColor: kPrimaryColor,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                itemCount: therapistList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Therapist _therapist = therapistList[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        _anyTherapist = false;
                      });
                    },
                    child: MyTherapistTile(
                      therapist: _therapist,
                      showRate: true,
                      showRating: true,
                      selected: _selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            MyButton(
              label: 'Continue',
              onTap: () {
                Get.to(
                  () => TherapistTimeSlot(),
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
