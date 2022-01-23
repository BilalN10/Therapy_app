import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/input_field.dart';

class EditProfileInputField extends StatelessWidget {
  const EditProfileInputField({
    Key key,
    @required TextEditingController contactTextController,
    @required this.title,
    @required this.hint,
    @required this.validator,
    this.readOnly = false,
    this.socialIcon,
    this.textInputType = TextInputType.text,
  })  : _contactTextController = contactTextController,
        super(key: key);

  final TextEditingController _contactTextController;
  final String title, hint, socialIcon;
  final TextInputType textInputType;
  final Function validator;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding * 0.1,
        horizontal: kDefaultPadding * 1.5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          socialIcon == null
              ? SizedBox(
                  width: getRelativeWidth(0.28),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.grey),
                  ))
              : SizedBox(
                  width: getRelativeWidth(0.12),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(
                      socialIcon,
                      height: 28,
                    ),
                  ),
                ),
          const SizedBox(width: kDefaultPadding * 0.5),
          Expanded(
            child: InputField(
              readOnly: readOnly,
              validator: validator,
              hint: hint,
              controller: _contactTextController,
              textInputType: textInputType,
            ),
          ),
        ],
      ),
    );
  }
}
