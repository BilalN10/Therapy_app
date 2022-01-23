import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';

class RadioSelector extends StatelessWidget {
  const RadioSelector({
    Key key,
    @required this.onChanged,
    @required this.title,
    @required this.radioValue,
    @required this.groupValue,
  }) : super(key: key);

  final Function onChanged;
  final String title;
  final int radioValue, groupValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.2),
      child: Row(
        children: [
          Radio(
            value: radioValue,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: kPrimaryColor,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
