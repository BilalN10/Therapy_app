import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key key,
    @required this.title,
    @required this.svgPath,
    @required this.onTap,
  }) : super(key: key);

  final String title;
  final String svgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        // contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        // leading: SvgPicture.asset(
        //   svgPath,
        //   height: 24,
        //   color: Colors.white,
        // ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
