import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';

class MiniButton extends StatelessWidget {
  const MiniButton({
    @required this.label,
    @required this.onTap,
    this.txtColor = kPrimaryColor,
    this.bgColor = Colors.white,
    Key key,
  }) : super(key: key);
  final VoidCallback onTap;
  final String label;
  final Color txtColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.25,
          horizontal: kDefaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: bgColor,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.caption.copyWith(
                color: txtColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
