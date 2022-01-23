// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:therapist/controller/profile_controller.dart';
import 'package:therapist/model/services/AuthService/auth_service.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/CommonPages/Forget_password/forget_password_page.dart';
import 'package:therapist/view/pages/CommonPages/Signup/signup_page.dart';
import 'package:therapist/view/pages/Root/root_page.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/input_field.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:get/get.dart';

class SigninPage extends StatelessWidget {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final bool isTherapist;
  final _formKey = GlobalKey<FormState>();

  final _authService = AuthService();
  SigninPage({Key key, @required this.isTherapist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getRelativeHeight(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign in",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding),
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: kDefaultPadding,
                    top: kDefaultPadding,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ForgetPasswordPage(),
                        );
                      },
                      child: Text(
                        'Forgot your password?',
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: kPrimaryColor,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 2.5),
                GetBuilder<ProfileController>(builder: (_controller) {
                  return MyButton(
                    label: "Sign In",
                    loading: _controller.isLoading,
                    onTap: () {
                      _validateUserInput();
                    },
                  );
                }),
                const SizedBox(height: kDefaultPadding),
                GestureDetector(
                  onTap: () {
                    Get.offAll(
                      () => SignupPage(
                        isTherapist: isTherapist,
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.caption,
                      children: [
                        TextSpan(
                          text: 'REGISTER',
                          style: Theme.of(context).textTheme.button.copyWith(
                                color: kPrimaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 2),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.only(right: kDefaultPadding),
                    height: 1.0,
                    width: getRelativeWidth(0.22),
                    color: Colors.grey,
                  ),
                  Text(
                    'Social Login',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: kDefaultPadding),
                    height: 1.0,
                    width: getRelativeWidth(0.22),
                    color: Colors.grey,
                  ),
                ]),
                const SizedBox(height: kDefaultPadding),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.facebook_sharp,
                      size: 56,
                      color: Color(0xFF4267B2),
                    ),
                  ),
                  const SizedBox(width: kDefaultPadding * 0.5),
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xFFDB4437),
                      child: Text(
                        'G',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          )),
    );
  }

  _validateUserInput() async {
    // if (_formKey.currentState.validate()) {
    //   print('validate');
    //   await _authService.signIn(
    //       _emailTextController.text, _passwordTextController.text, isTherapist);
    Get.offAll(
      () => RootPage(
        isTherapist: isTherapist,
      ),
    );
    // } else {
    //   print('not validate');
    // }
  }
}
