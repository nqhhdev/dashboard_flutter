import 'package:app_desktop/presentation/common/drawer.dart';
import 'package:flutter/material.dart';

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
    ///TODO: transfer trailingNumber from outside
    String trailingNumber = '';

    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: selected ? Colors.grey : Colors.transparent),
      child: ListTile(
        leading: drawerScreenType.icon == Icons.notifications
            ? const SizedBox()
            : Icon(
                drawerScreenType.icon,
                color: selected ? Colors.white54 : Colors.black,
                size: 24,
              ),
        selected: selected,
        onTap: onTap,
        title: Text(
          drawerScreenType.title,
          overflow: TextOverflow.ellipsis,
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
