import 'package:app_desktop/config/colors.dart';
import 'package:app_desktop/config/style.dart';
import 'package:app_desktop/presentation/common/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileForDrawer extends StatelessWidget {
  const ListTileForDrawer({
    Key? key,
    this.selected = false,
    required this.onTap,
    required this.navIndex,
  }) : super(key: key);

  final bool selected;
  final VoidCallback onTap;
  final int navIndex;

  DrawerScreenType get drawerScreenType => DrawerScreenType.values[navIndex];

  Widget get listTileBodyWidget {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: selected ? Colors.grey.shade200 : Colors.transparent),
      child: ListTile(
        horizontalTitleGap: 0,
        leading: SvgPicture.asset(
          drawerScreenType.icon,
          color: selected ? Colors.black : AppColors.colorIcon,
          height: 26,
          width: 26,
        ),
        selected: selected,
        onTap: onTap,
        title: Text(
          drawerScreenType.title,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.label22
              .copyWith(color: selected ? Colors.black : Colors.transparent),
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return listTileBodyWidget;
  }
}
