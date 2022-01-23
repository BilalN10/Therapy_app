import 'package:flutter/material.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key key,
    @required this.selectedTab,
    @required this.tabs,
    @required this.onItemPressed,
  }) : super(key: key);

  final int selectedTab;
  final List<String> tabs;
  final Function(int) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabs.map((e) {
          return TabItem(
            onItemPressed: onItemPressed,
            index: tabs.indexOf(e),
            selectedIndex: selectedTab,
            label: e,
          );
        }).toList(),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key key,
    @required this.onItemPressed,
    @required this.index,
    @required this.selectedIndex,
    @required this.label,
  }) : super(key: key);

  final Function(int p1) onItemPressed;
  final int index, selectedIndex;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemPressed(index);
      },
      child: selectedIndex == index
          ? Container(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding * 0.5, horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kPrimaryColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 25,
                    offset: const Offset(0, 5),
                    color: kPrimaryColor.withOpacity(0.75),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            )
          : Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
    );
  }
}
