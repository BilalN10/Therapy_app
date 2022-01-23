import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:therapist/controller/profile_controller.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class EditProfileDropDown extends StatelessWidget {
  const EditProfileDropDown({
    Key key,
    @required this.title,
    @required this.dropDownKey,
  }) : super(key: key);

  final String title, dropDownKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding * 0.1,
        horizontal: kDefaultPadding * 1.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: getRelativeWidth(0.3),
            ),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.grey),
            ),
          ),
          const SizedBox(width: 4),
          GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (_controller) {
              return DropdownButton<String>(
                  value: dropDownData[dropDownKey]['value'],
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: Theme.of(context).textTheme.subtitle2,
                  underline: Container(height: 0, color: kPrimaryColor),
                  onChanged: (String newValue) {
                    _controller.updateDropDownValue(dropDownKey, newValue);
                  },
                  items: dropDownData[dropDownKey]['list']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    },
                  ).toList());
            },
          ),
        ],
      ),
    );
  }
}
