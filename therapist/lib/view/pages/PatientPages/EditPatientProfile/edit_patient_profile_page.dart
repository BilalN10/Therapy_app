import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:therapist/controller/profile_controller.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/widgets/editprofile_dropdown.dart';
import 'package:therapist/view/widgets/editprofile_inputfield.dart';
import 'package:therapist/view/widgets/Dialogs/image_pick_dialog.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/my_button.dart';

class EditPatientProfilePage extends StatelessWidget {
  final _nameTextController = TextEditingController();
  final _contactTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _heightTextController = TextEditingController();
  final _weightTextController = TextEditingController();
  final _emergencyContactTextController = TextEditingController();

  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    String imgPath;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        elevation: 1,
        backgroundColor: kAppBarBGColor,
        title: Text(
          "Edit Profile",
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
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Form(
          child: Scrollbar(
            radius: const Radius.circular(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Stack(children: [
                    CircleAvatar(
                      radius: getRelativeWidth(0.18),
                      backgroundImage: AssetImage(
                          imgPath == null ? "assets/images/b.jpg" : imgPath),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        radius: 22,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ImagePickDialog();
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: kDefaultPadding),
                  EditProfileInputField(
                      title: 'Name',
                      hint: 'Your Name',
                      contactTextController: _nameTextController,
                      textInputType: TextInputType.name,
                      validator: (value) {}),
                  EditProfileInputField(
                    title: 'Contact Number',
                    hint: '123 456 7890',
                    contactTextController: _contactTextController,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (!GetUtils.isPhoneNumber(value))
                        return 'Invalid Number';
                      else
                        return null;
                    },
                  ),
                  EditProfileInputField(
                    title: 'Email',
                    hint: 'mail@example.com',
                    contactTextController: _emailTextController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (!GetUtils.isEmail(value))
                        return 'Invalid Email';
                      else
                        return null;
                    },
                  ),
                  const EditProfileDropDown(
                    dropDownKey: 'gender',
                    title: 'Gender',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 1.5,
                      vertical: kDefaultPadding * 0.1,
                    ),
                    child: Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: getRelativeWidth(0.3),
                          ),
                          child: Text(
                            'Date of Birth',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                        const Spacer(),
                        GetBuilder<ProfileController>(
                          init: ProfileController(),
                          builder: (value) => Text(
                            DateFormat.yMd().format(value.dob),
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _getDateFromUser(context);
                          },
                          child: const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const EditProfileDropDown(
                    dropDownKey: 'bloodgroup',
                    title: 'Blood Group',
                  ),
                  const EditProfileDropDown(
                    dropDownKey: 'maritalstatus',
                    title: 'Marital Status',
                  ),
                  EditProfileInputField(
                    title: 'Height',
                    hint: 'Add Height',
                    contactTextController: _heightTextController,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (!GetUtils.isNum(value))
                        return 'Invalid Number';
                      else
                        return null;
                    },
                  ),
                  EditProfileInputField(
                    title: 'Weight',
                    hint: 'Add Weight',
                    contactTextController: _weightTextController,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (!GetUtils.isNum(value))
                        return 'Invalid Number';
                      else
                        return null;
                    },
                  ),
                  EditProfileInputField(
                    title: 'Emergency Contact',
                    hint: 'Add Emergency Contact',
                    contactTextController: _emergencyContactTextController,
                    textInputType: TextInputType.number,
                    validator: (value) {
                      if (!GetUtils.isPhoneNumber(value))
                        return 'Invalid Number';
                      else
                        return null;
                    },
                  ),
                  const SizedBox(height: kDefaultPadding * 2),
                  MyButton(
                    onTap: () {},
                    label: 'Update Profile',
                  ),
                  const SizedBox(height: kDefaultPadding * 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getDateFromUser(BuildContext context) async {
    final DateTime _pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.utc(2000),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1950),
      lastDate: DateTime(2020),
    );
    if (_pickedDate != null) {
      _profileController.updateDOB(_pickedDate);
    }
  }
}
