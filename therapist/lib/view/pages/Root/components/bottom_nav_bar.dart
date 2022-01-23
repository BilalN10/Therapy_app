import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class BottomNavigation extends StatelessWidget {
  final List<IconData> itemIcons;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  final VoidCallback onCenterTap;
  const BottomNavigation({
    Key key,
    @required this.itemIcons,
    @required this.onCenterTap,
    @required this.centerIcon,
    @required this.selectedIndex,
    @required this.onItemPressed,
  }) : assert(itemIcons.length != 3, "Item must equal 4");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: getRelativeHeight(0.09),
      width: SizeConfig.screenWidth,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: getRelativeHeight(0.065),
              width: SizeConfig.screenWidth,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    icon: itemIcons[0],
                    selectedIndex: selectedIndex,
                    index: 0,
                    label: 'Home',
                  ),
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    icon: itemIcons[1],
                    selectedIndex: selectedIndex,
                    index: 1,
                    label: 'Profile',
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.14,
                  ),
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    icon: itemIcons[2],
                    selectedIndex: selectedIndex,
                    index: 2,
                    label: 'Messages',
                  ),
                  BottomNavItem(
                    onItemPressed: onItemPressed,
                    icon: itemIcons[3],
                    selectedIndex: selectedIndex,
                    index: 3,
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: onCenterTap,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                        color: kPrimaryColor.withOpacity(0.75),
                      ),
                      // BoxShadow(
                      //   blurRadius: 25,
                      //   offset: Offset(0, 5),
                      //   color: kPrimaryColor.withOpacity(0.75),
                      // )
                    ],
                    color: kPrimaryColor,
                  ),
                  height: getRelativeWidth(0.135),
                  width: getRelativeWidth(0.135),
                  child: Center(
                      child: Icon(
                    centerIcon,
                    color: Colors.white,
                    size: getRelativeWidth(0.07),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key key,
    @required this.onItemPressed,
    @required this.icon,
    @required this.index,
    @required this.selectedIndex,
    @required this.label,
  }) : super(key: key);

  final Function(int p1) onItemPressed;
  final IconData icon;
  final int index, selectedIndex;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemPressed(index);
      },
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selectedIndex == index ? kPrimaryColor : kLightTextColor,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.caption.copyWith(
                  color:
                      selectedIndex == index ? kPrimaryColor : kLightTextColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
