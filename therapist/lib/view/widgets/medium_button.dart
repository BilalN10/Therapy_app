import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class MediumButton extends StatelessWidget {
  const MediumButton({
    Key key,
    @required this.label,
    @required this.onTap,
    @required this.width,
    this.loading = false,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool loading;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading
          ? () {
              //  print('button is disabled');
            }
          : onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 1.5,
        ),
        height: 46,
        width: width,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kBorderRadius),
            boxShadow: [
              BoxShadow(
                blurRadius: 25,
                offset: const Offset(0, 5),
                color: kPrimaryColor.withOpacity(0.75),
              ),
            ]),
        child: Center(
          child: loading
              ? const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                )
              : Text(label,
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                      )),
        ),
      ),
    );
  }
}
