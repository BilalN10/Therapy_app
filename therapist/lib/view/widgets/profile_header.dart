import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
    @required this.imgPath,
    @required this.name,
    @required this.subtitle,
    @required this.widget,
  }) : super(key: key);

  final String imgPath, name, subtitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
        horizontal: kDefaultPadding,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 36,
            backgroundImage: AssetImage(imgPath),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //color: Colors.yellow,
                width: SizeConfig.screenWidth - 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.call,
                          color: kPrimaryColor,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.chat,
                          color: kPrimaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: kDefaultPadding * 0.2,
              ),
              widget,
            ],
          )
        ],
      ),
    );
  }
}
