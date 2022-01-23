import 'package:flutter/material.dart';
import 'package:therapist/view/size_config.dart';

class StatCounter extends StatelessWidget {
  const StatCounter({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    @required this.iconColor,
  }) : super(key: key);
  final IconData icon;
  final String title, subtitle;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getRelativeWidth(0.3),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
