import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/check_box.dart';
import 'package:therapist/view/widgets/heading_tile.dart';
import 'package:therapist/view/widgets/input_field.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:therapist/view/widgets/radio_selector.dart';

class FilterTherapistPage extends StatefulWidget {
  @override
  _FilterTherapistPageState createState() => _FilterTherapistPageState();
}

class _FilterTherapistPageState extends State<FilterTherapistPage> {
  final List<String> _sortByOptions = [
    'Default',
    'price',
    "Highest rated",
    "Lowest rated",
    "Distance"
  ];

  final List<String> _availabilityOptions = [
    'Available Any Day',
    'Available Today',
    'Available in 3 Days',
    'Available Coming Weekend',
  ];

  final List<String> _consultationFeeOptions = [
    'Free',
    '1-50',
    '51-100',
    '151+',
  ];

  int _selectedSortByOption = 0;
  int _selectedAvailabilityOption = 0;
  int _selectedConsultationFeeOption = 0;
  bool _male = false;
  bool _female = false;
  bool _free = false;

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
          "Filter",
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
      ),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                radius: const Radius.circular(
                  kBorderRadius,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const GreyHeadingTile(
                        title: 'Sort by',
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _sortByOptions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RadioSelector(
                              groupValue: 1,
                              title: _sortByOptions[index],
                              onChanged: (v) {
                                setState(() {
                                  _selectedSortByOption = index;
                                });
                              },
                              radioValue:
                                  _selectedSortByOption == index ? 1 : 0,
                            );
                          }),
                      const GreyHeadingTile(
                        title: 'Availability',
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _availabilityOptions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return RadioSelector(
                              groupValue: 1,
                              title: _availabilityOptions[index],
                              onChanged: (v) {
                                setState(() {
                                  _selectedAvailabilityOption = index;
                                });
                              },
                              radioValue:
                                  _selectedAvailabilityOption == index ? 1 : 0,
                            );
                          }),
                      const GreyHeadingTile(
                        title: 'Gender',
                      ),
                      CheckBox(
                        title: 'Male Therapist',
                        onChanged: (v) {
                          setState(() {
                            _male = !_male;
                          });
                        },
                        value: _male,
                      ),
                      CheckBox(
                        title: 'Female Therapist',
                        onChanged: (v) {
                          setState(() {
                            _female = !_female;
                          });
                        },
                        value: _female,
                      ),
                      const GreyHeadingTile(
                        title: 'Consultation Fee',
                      ),
                      CheckBox(
                        title: 'Free',
                        onChanged: (v) {
                          setState(() {
                            _free = !_free;
                          });
                        },
                        value: _free,
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const InputField(
                            validator: null,
                            hint: "Enter amount",
                            controller: null),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemCount: 1,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return RadioSelector(
                      //         groupValue: 1,
                      //         title: _consultationFeeOptions[index],
                      //         onChanged: (v) {
                      //           setState(() {
                      //             _selectedConsultationFeeOption = index;
                      //           });
                      //         },
                      //         radioValue:
                      //             _selectedConsultationFeeOption == index
                      //                 ? 1
                      //                 : 0,
                      //       );
                      //     }),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: kDefaultPadding,
              ),
              child: MyButton(
                label: 'Apply',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
