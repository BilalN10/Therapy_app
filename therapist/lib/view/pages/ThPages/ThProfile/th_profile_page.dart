import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/Dialogs/success_dialog.dart';
import 'package:therapist/view/widgets/editprofile_dropdown.dart';
import 'package:therapist/view/widgets/editprofile_inputfield.dart';
import 'package:therapist/view/widgets/Dialogs/image_pick_dialog.dart';
import 'package:therapist/view/widgets/heading_tile.dart';
import 'package:therapist/view/widgets/my_button.dart';

class ThProfilePage extends StatefulWidget {
  final bool editProfile;

  const ThProfilePage({Key key, @required this.editProfile}) : super(key: key);

  @override
  _ThProfilePageState createState() => _ThProfilePageState();
}

class _ThProfilePageState extends State<ThProfilePage> {
  final _specialization = TextEditingController();

  final _nameTextController = TextEditingController();
  final _contactTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _cityTextController = TextEditingController();
  final _postalCodeTextController = TextEditingController();
  final _licenseTextController = TextEditingController();
  final _eperianceTextController = TextEditingController();

  final _fbUsernameTextController = TextEditingController();
  final _igUsernameTextController = TextEditingController();
  final _websiteTextController = TextEditingController();
  final _twitterTextController = TextEditingController();
  final _introductionTextController = TextEditingController();
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  void initState() {
    super.initState();
    _nameTextController.text = 'Jason Roy';
  }

  @override
  Widget build(BuildContext context) {
    String imgPath;
    return Scaffold(
      appBar: widget.editProfile
          ? AppBar(
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
                icon: Icon(
                  widget.editProfile ? Icons.close : Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            )
          : null,
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Scrollbar(
          radius: const Radius.circular(kBorderRadius),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getRelativeHeight(0.3),
                  width: SizeConfig.screenWidth,
                  child: Stack(alignment: Alignment.center, children: [
                    // Back Cover Photo
                    SizedBox(
                      height: getRelativeHeight(0.3),
                      width: SizeConfig.screenWidth,
                      child: Image.asset(
                        'assets/images/a.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    widget.editProfile
                        ? Positioned(
                            top: 4,
                            right: 4,
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
                                Icons.edit,
                                color: kPrimaryColor,
                                size: 24,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    // Profile Photo
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: getRelativeWidth(0.18),
                          backgroundImage: AssetImage(imgPath == null
                              ? "assets/images/c5.jpg"
                              : imgPath),
                        ),
                        widget.editProfile
                            ? Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: kPrimaryColor,
                                  radius: 20,
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
                                      size: 20,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ]),
                ),
                const GreyHeadingTile(
                  title: 'Introduction',
                ),
                EditProfileInputField(
                    readOnly: !widget.editProfile,
                    title: 'About',
                    hint: 'Write something about yourself!',
                    contactTextController: _introductionTextController,
                    validator: (value) {}),
                const SizedBox(height: kDefaultPadding),
                const GreyHeadingTile(
                  title: 'Basic Information',
                ),
                EditProfileInputField(
                    readOnly: !widget.editProfile,
                    title: 'Name',
                    hint: 'Your Name',
                    contactTextController: _nameTextController,
                    textInputType: TextInputType.name,
                    validator: (value) {}),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'Contact Number',
                  hint: 'Contact Number',
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
                  readOnly: !widget.editProfile,
                  title: 'Email',
                  hint: 'Your Email',
                  contactTextController: _emailTextController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!GetUtils.isEmail(value))
                      return 'Invalid Email';
                    else
                      return null;
                  },
                ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'License No.',
                  hint: 'License No.',
                  contactTextController: _licenseTextController,
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'Required';
                    else
                      return null;
                  },
                ),
                EditProfileInputField(
                  textInputType: TextInputType.number,
                  readOnly: !widget.editProfile,
                  title: 'Experiance',
                  hint: 'in years',
                  contactTextController: _eperianceTextController,
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'Required';
                    else
                      return null;
                  },
                ),
                const SizedBox(
                  height: kDefaultPadding * 1,
                ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 1.5 * kDefaultPadding),
                //     child: ConstrainedBox(
                //       constraints: BoxConstraints(
                //         maxWidth: getRelativeWidth(0.6),
                //       ),
                //       child: Text(
                //         'Licensed State',
                //         style: Theme.of(context)
                //             .textTheme
                //             .subtitle1
                //             .copyWith(color: Colors.grey),
                //       ),
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: kDefaultPadding * 1,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 1.5),
                  child: SizedBox(
                    height: 135,
                    child: Column(
                      children: [
                        Row(
                          //  mainAxisAlignment:  MainAxisAlignment.start,
                          children: const [
                            Text(
                              "United State",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding * 1,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ConstrainedBox(
                            //   constraints: BoxConstraints(
                            //     maxWidth: getRelativeWidth(0.3),
                            //   ),
                            //   child: Text(
                            //     'Licensed State',
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .subtitle1
                            //         .copyWith(color: Colors.grey),
                            //   ),
                            // ),
                            const SizedBox(width: 8),
                            licensedState()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                EditProfileInputField(
                  contactTextController: null,
                  readOnly: !widget.editProfile,
                  title: 'NPI Number',
                  hint: 'NPI Number',
                  //contactTextController: _cityTextController,
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'Required';
                    else
                      return null;
                  },
                ),
                const EditProfileDropDown(
                  dropDownKey: 'gender',
                  title: 'Gender',
                ),
                const EditProfileDropDown(
                  dropDownKey: 'provider_type',
                  title: 'Provider Type',
                ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'City',
                  hint: 'Your City',
                  contactTextController: _cityTextController,
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'Required';
                    else
                      return null;
                  },
                ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'Postal Code',
                  hint: 'Postal Code',
                  contactTextController: _postalCodeTextController,
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'Required';
                    else
                      return null;
                  },
                ),
                // EditProfileInputField(
                //   readOnly: !widget.editProfile,
                //   title: 'Hospital Name',
                //   hint: 'Hospital Name',
                //   contactTextController: _cityTextController,
                //   validator: (value) {
                //     if (value.isEmpty || value == null)
                //       return 'Required';
                //     else
                //       return null;
                //   },
                // ),
                // EditProfileInputField(
                //   readOnly: !widget.editProfile,
                //   title: 'Hospital Address',
                //   hint: 'Hospital Address',
                //   contactTextController: _cityTextController,
                //   validator: (value) {
                //     if (value.isEmpty || value == null)
                //       return 'Required';
                //     else
                //       return null;
                //   },
                // ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'Specialization',
                  hint: 'Therapist Specialization',
                  contactTextController: _specialization,
                  validator: (value) {
                    if (value.isEmpty || value == null)
                      return 'Required';
                    else
                      return null;
                  },
                ),
                const SizedBox(height: kDefaultPadding * 2),
                const GreyHeadingTile(
                  title: 'Social Links',
                ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'Facebook',
                  hint: 'Facebook Username',
                  socialIcon: 'assets/icons/facebook.svg',
                  contactTextController: _fbUsernameTextController,
                  validator: (value) {
                    if (!GetUtils.isUsername(value))
                      return 'Invalid Username';
                    else
                      return null;
                  },
                ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'Instagram',
                  hint: 'Instagram Username',
                  socialIcon: 'assets/icons/instagram.svg',
                  contactTextController: _igUsernameTextController,
                  validator: (value) {
                    if (!GetUtils.isUsername(value))
                      return 'Invalid Username';
                    else
                      return null;
                  },
                ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'Twitter',
                  hint: 'Twitter Username',
                  socialIcon: 'assets/icons/twitter.svg',
                  contactTextController: _twitterTextController,
                  validator: (value) {
                    if (!GetUtils.isUsername(value))
                      return 'Invalid Username';
                    else
                      return null;
                  },
                ),
                EditProfileInputField(
                  readOnly: !widget.editProfile,
                  title: 'Website',
                  hint: 'Website URL',
                  socialIcon: 'assets/icons/www.svg',
                  contactTextController: _websiteTextController,
                  validator: (value) {
                    if (!GetUtils.isURL(value))
                      return 'Invalid URL';
                    else
                      return null;
                  },
                ),
                const SizedBox(height: kDefaultPadding * 3),
                MyButton(
                  onTap: widget.editProfile
                      ? () {
                          Get.back();

                          Dialogs.snackBar(
                            title: 'Updated',
                            subTitle: 'Your profile has been updated',
                          );
                        }
                      : () {
                          Get.to(
                            () => const ThProfilePage(
                              editProfile: true,
                            ),
                          );
                        },
                  label: widget.editProfile ? 'Update Profile' : 'Edit Profile',
                ),
                const SizedBox(height: kDefaultPadding * 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded licensedState() {
    return Expanded(
      child: Column(
        children: [
          CSCPicker(
            ///Enable disable state dropdown [OPTIONAL PARAMETER]
            // showStates: true,

            /// Enable disable city drop down [OPTIONAL PARAMETER]
            // showCities: true,

            ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
            flagState: CountryFlag.DISABLE,

            ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
            dropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey.shade300,
                )),

            ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
            disabledDropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade300,
                border: Border.all(
                  color: Colors.grey.shade300,
                )),

            ///Default Country
            defaultCountry: DefaultCountry.United_States,

            ///selected item style [OPTIONAL PARAMETER]
            selectedItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///DropdownDialog Heading style [OPTIONAL PARAMETER]
            dropdownHeadingStyle: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

            ///DropdownDialog Item style [OPTIONAL PARAMETER]
            dropdownItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///Dialog box radius [OPTIONAL PARAMETER]
            dropdownDialogRadius: 10.0,

            ///Search bar radius [OPTIONAL PARAMETER]
            searchBarRadius: 10.0,

            ///triggers once country selected in dropdown
            onCountryChanged: (value) {
              setState(() {
                ///store value in country variable
                countryValue = "United States";
                //print(countryValue);
              });
            },

            ///triggers once state selected in dropdown
            onStateChanged: (value) {
              setState(() {
                ///store value in state variable
                stateValue = value;
              });
            },

            ///triggers once city selected in dropdown
            onCityChanged: (value) {
              setState(() {
                ///store value in city variable
                cityValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
