import 'package:flutter/material.dart';
import 'package:therapist/controller/profile_controller.dart';
import 'package:therapist/model/models/patient_model.dart';
import 'package:therapist/model/models/therapist_model.dart';
import 'package:therapist/model/services/AuthService/auth_service.dart';
import 'package:therapist/model/services/DatabaseService/database_service.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/CommonPages/Signin/signin_page.dart';
import 'package:therapist/view/pages/Root/root_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/input_field.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final bool isTherapist;
  final _formKey = GlobalKey<FormState>();
  final _profileController = Get.find<ProfileController>();
  final _authService = AuthService();
  final _dbService = DatabaseService();
  SignupPage({Key key, @required this.isTherapist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getRelativeHeight(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign up",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      InputField(
                        validator: (value) {
                          if (value.isEmpty || value == null)
                            return 'Required';
                          else
                            return null;
                        },
                        hint: "Full Name",
                        label: 'Name',
                        //    textInputType: TextInputType.text,
                        controller: _nameTextController,
                      ),
                      const SizedBox(height: kDefaultPadding * 0.75),
                      InputField(
                        validator: (value) {
                          if (!GetUtils.isEmail(value))
                            return 'Invalid Email';
                          else
                            return null;
                        },
                        hint: "mail@example.com",
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                        controller: _emailTextController,
                      ),
                      const SizedBox(height: kDefaultPadding * 0.75),
                      InputField(
                        isPassField: true,
                        validator: (value) {
                          if (value.length < 8)
                            return 'Password is short';
                          else
                            return null;
                        },
                        hint: "Password",
                        label: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        controller: _passwordTextController,
                      ),
                      const SizedBox(height: kDefaultPadding * 0.75),
                      InputField(
                        isPassField: true,
                        validator: (value) {
                          if (_passwordTextController.text !=
                              _confirmPasswordTextController.text)
                            return 'Password not match';
                          else if (_confirmPasswordTextController
                                  .text.isEmpty ||
                              _confirmPasswordTextController.text == null) {
                            return 'Required';
                          } else
                            return null;
                        },
                        hint: "ReEnter Password",
                        label: 'Confirm Password',
                        textInputType: TextInputType.visiblePassword,
                        controller: _confirmPasswordTextController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 2.5),
                GetBuilder<ProfileController>(builder: (_controller) {
                  return MyButton(
                    label: "Sign Up",
                    loading: _controller.isLoading,
                    onTap: () {
                      // _validateUserInput();
                      Get.offAll(
                        () => RootPage(
                          isTherapist: isTherapist,
                        ),
                      );
                    },
                  );
                }),
                const SizedBox(height: kDefaultPadding),
                GestureDetector(
                  onTap: () {
                    Get.offAll(
                      () => SigninPage(
                        isTherapist: isTherapist,
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.caption,
                      children: [
                        TextSpan(
                          text: 'LOGIN',
                          style: Theme.of(context).textTheme.button.copyWith(
                                color: kPrimaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  _validateUserInput() async {
    if (_formKey.currentState.validate()) {
      //  print('validate');
      final bool isRegistered = await _authService.signUp(
          _emailTextController.text, _passwordTextController.text);
      if (isRegistered) {
        if (isTherapist) {
          final Therapist _therapist = Therapist(
            uid: _profileController.userID,
            name: _nameTextController.text,
            password: _passwordTextController.text,
          );
          final bool dbCreated =
              await _dbService.createNewTherapistInDB(therapist: _therapist);
          if (dbCreated)
            Get.offAll(
              () => SigninPage(isTherapist: isTherapist),
            );
        } else if (!isTherapist) {
          final Patient _patient = Patient(
            uid: _profileController.userID,
            name: _nameTextController.text,
            email: _emailTextController.text,
            password: _passwordTextController.text,
          );
          final bool dbCreated =
              await _dbService.createNewPatientInDB(patient: _patient);
          if (dbCreated)
            Get.offAll(
              () => SigninPage(isTherapist: isTherapist),
            );
        }
      }
    } else {
      //  print('not validate');
    }
  }
}
