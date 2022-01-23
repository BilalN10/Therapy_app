import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    Key key,
    @required this.onTap,
    @required this.label,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
