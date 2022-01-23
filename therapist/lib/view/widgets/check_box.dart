import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.title,
  }) : super(key: key);

  final Function(bool) onChanged;
  final String title;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        bottom: kDefaultPadding * 0.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
