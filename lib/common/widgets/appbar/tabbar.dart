import 'package:flutter/material.dart';
import 'package:pkart/utils/constants/colors.dart';
import 'package:pkart/utils/device/device_utility.dart';
import 'package:pkart/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget{
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primaryColor,
        labelColor: dark ? TColors.white : TColors.primaryColor,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }

  @override

  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());

}