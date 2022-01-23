import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/Root/root_page.dart';
import 'package:therapist/view/widgets/editprofile_dropdown.dart';
import 'package:therapist/view/widgets/input_field.dart';
import 'package:therapist/view/widgets/my_button.dart';

import '../../../size_config.dart';

class AddServicePage extends StatelessWidget {
  final _serviceTitleController = TextEditingController();
  final _servicePriceController = TextEditingController();
  final _serviceDescriptionController = TextEditingController();

  final List<int> serviceTime = [
    15,
    30,
    45,
    60,
    90,
    120,
  ];

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
          "Add Service",
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
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 1.25,
                ),
                child: InputField(
                  validator: (val) {
                    if (val.isEmpty || val == null)
                      return 'Required';
                    else
                      return null;
                  },
                  hint: 'Service Title',
                  label: 'Service Title',
                  controller: _serviceTitleController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 1.25,
                ),
                child: InputField(
                  textInputType: TextInputType.number,
                  validator: (val) {
                    if (val.isEmpty || val == null)
                      return 'Required';
                    else
                      return null;
                  },
                  hint: 'Service Price',
                  label: 'Service Price',
                  controller: _servicePriceController,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 0.5),
              const EditProfileDropDown(
                dropDownKey: 'service_time',
                title: 'Service Time (minutes)',
              ),
              const Divider(),
              const EditProfileDropDown(
                dropDownKey: 'service_type',
                title: 'Medical concern',
              ),
              const Divider(),

              // const EditProfileDropDown(
              //   dropDownKey: 'therapist_categories',
              //   title: 'Service Category',
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: DropdownButtonFormField(
              //     isDense: false,
              //     itemHeight: 60,
              //     value: dropDownData['therapist_categories']['value'],
              //     hint: Text('Service Category'),
              //     items: dropDownData['therapist_categories']['list']
              //         .map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (val) {},
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.2),
                child: InputField(
                  validator: (val) {
                    if (val.isEmpty || val == null)
                      return 'Required';
                    else
                      return null;
                  },
                  hint: 'Description',
                  label: 'Description',
                  controller: _serviceDescriptionController,
                  maxLines: null,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 3),
              MyButton(
                label: 'Add Service',
                onTap: () {
                  Get.offAll(
                    () => const RootPage(
                      isTherapist: true,
                    ),
                  );
                },
              ),
              const SizedBox(height: kDefaultPadding * 3),
            ],
          ),
        ),
      ),
    );
  }
}
