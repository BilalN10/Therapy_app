import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/widgets/input_field.dart';
import 'package:therapist/view/widgets/my_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  final _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 1,
        title: Text(
          'Forget Password',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10 * kDefaultPadding),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2 * kDefaultPadding,
                  ),
                  child: InputField(
                    validator: (value) {
                      if (!GetUtils.isEmail(value))
                        return 'Invalid Email';
                      else
                        return null;
                    },
                    hint: "mail@example.com",
                    label: 'Enter Email',
                    textInputType: TextInputType.emailAddress,
                    controller: _emailTextController,
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 6),
                MyButton(
                  label: 'Next',
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
