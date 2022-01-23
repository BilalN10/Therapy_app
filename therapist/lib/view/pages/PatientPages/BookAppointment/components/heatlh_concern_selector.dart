import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';

class HealthConcernSelector extends StatelessWidget {
  const HealthConcernSelector({
    Key key,
    @required this.imgPath,
    @required this.specialisty,
    @required this.onTap,
    this.selected = false,
  }) : super(key: key);

  final String imgPath, specialisty;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding * 0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          ),
          color: selected ? kPrimaryColor : Colors.white,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(imgPath)),
            ),
            const SizedBox(
              height: kDefaultPadding * 0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  specialisty,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: selected ? Colors.white : Colors.black,
                      ),
                  //overflow: ,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
