import 'package:app_desktop/config/responsive.dart';
import 'package:app_desktop/gen/assets.gen.dart';
import 'package:app_desktop/presentation/common/drawer.dart';
import 'package:app_desktop/presentation/common/list_tile_for_drawer.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key? key,
    this.paddingRightAvatar = 16,
    this.paddingAllTotal = 16,
    required this.selectedIndex,
    required this.setIndex,
  }) : super(key: key);

  final double paddingRightAvatar;
  final double paddingAllTotal;

  final Function setIndex;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        // height: MediaQuery.of(context).size.height / 2,
        decoration: const BoxDecoration(color: AppColors.white),
        child: Padding(
          padding: EdgeInsets.all(paddingAllTotal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Assets.icons.logo.svg(),
              InkWell(
                onTap: () {},
                child: const SizedBox(),
              ),
              const Divider(),
              ...DrawerScreenType.values.map((screenType) {
                return ListTileForDrawer(
                  onTap: () {
                    _navItemClicked(
                      context: context,
                      screenType: screenType,
                    );
                  },
                  selected: screenType.index == selectedIndex,
                  navIndex: screenType.index,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _navItemClicked(
      {required BuildContext context,
      required DrawerScreenType screenType}) async {
    final currentOrientation = MediaQuery.of(context).orientation;
    if (Responsive.isMobile(context) ||
        currentOrientation == Orientation.portrait) {
      Navigator.of(context).pop();
    }
    switch (screenType) {
      case DrawerScreenType.person:

      case DrawerScreenType.download:

      case DrawerScreenType.task:

      case DrawerScreenType.images:

      case DrawerScreenType.calendar:

      case DrawerScreenType.fire:

      case DrawerScreenType.clock:

      case DrawerScreenType.setting:
        setIndex(screenType.index);
        break;
    }
  }
}
