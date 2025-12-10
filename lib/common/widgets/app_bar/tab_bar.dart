import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/device/device_utility.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? Colors.black : ColorsScheme.white,
      child: TabBar(
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: ColorsScheme.primary,
        unselectedLabelColor: ColorsScheme.darkGrey,
        labelColor: HelperFunctions.isDarkMode(context)
            ? ColorsScheme.white
            : ColorsScheme.primary,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppBarHeight());
}
