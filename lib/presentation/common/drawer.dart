import 'package:app_desktop/gen/assets.gen.dart';
import 'package:app_desktop/presentation/screen/dashboard/dashboard_route.dart';
import 'package:app_desktop/presentation/screen/documents/documents_route.dart';
import 'package:app_desktop/presentation/screen/notification/notification_route.dart';
import 'package:app_desktop/presentation/screen/profile/profile_route.dart';
import 'package:app_desktop/presentation/screen/settings/settings_route.dart';
import 'package:app_desktop/presentation/screen/store/store_route.dart';
import 'package:app_desktop/presentation/screen/task/task_route.dart';
import 'package:app_desktop/presentation/screen/transaction/transaction_route.dart';
import 'package:flutter/material.dart';

enum DrawerScreenType {
  person,
  download,
  task,
  images,
  calendar,
  fire,
  clock,
  setting,
}

extension DrawerEnum on DrawerScreenType {
  String get icon {
    switch (this) {
      case DrawerScreenType.person:
        return Assets.icons.person.path;
      case DrawerScreenType.download:
        return Assets.icons.download.path;

      case DrawerScreenType.task:
        return Assets.icons.chart.path;
      case DrawerScreenType.images:
        return Assets.icons.image.path;
      case DrawerScreenType.calendar:
        return Assets.icons.calendar.path;
      case DrawerScreenType.fire:
        return Assets.icons.fire.path;
      case DrawerScreenType.clock:
        return Assets.icons.clock.path;
      case DrawerScreenType.setting:
        return Assets.icons.settings.path;
    }
  }

  String get title {
    switch (this) {
      case DrawerScreenType.person:
        return "Profile";
      case DrawerScreenType.download:
        return "Download";

      case DrawerScreenType.task:
        return "Task";
      case DrawerScreenType.images:
        return "Images";
      case DrawerScreenType.calendar:
        return "Calendar";
      case DrawerScreenType.fire:
        return "Fire";
      case DrawerScreenType.clock:
        return "Plans";
      case DrawerScreenType.setting:
        return "Settings";
    }
  }
}

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({
    Key? key,
    required this.navIndex,
    this.isTitle = false,
  }) : super(key: key);

  final int navIndex;
  final bool isTitle;

  DrawerScreenType get drawerScreenType => DrawerScreenType.values[navIndex];

  Widget get bodyWidget {
    switch (drawerScreenType) {
      case DrawerScreenType.person:
        return DashboardRoute.route;
      case DrawerScreenType.download:
        return TransactionRoute.route;
      case DrawerScreenType.task:
        return TaskRoute.route;
      case DrawerScreenType.images:
        return DocumentsRoute.route;
      case DrawerScreenType.calendar:
        return StoreRoute.route;
      case DrawerScreenType.fire:
        return NotificationRoute.route;
      case DrawerScreenType.clock:
        return ProfileRoute.route;
      case DrawerScreenType.setting:
        return SettingsRoute.route;
    }
  }

  Widget get titleAppbarWidget {
    String titleAppbar = "";
    switch (drawerScreenType) {
      case DrawerScreenType.person:
        titleAppbar = "Dashboard";
        break;
      case DrawerScreenType.download:
        titleAppbar = "Transaction";
        break;
      case DrawerScreenType.task:
        titleAppbar = "Task";
        break;
      case DrawerScreenType.images:
        titleAppbar = "Documents";
        break;
      case DrawerScreenType.calendar:
        titleAppbar = "Store";
        break;
      case DrawerScreenType.clock:
        titleAppbar = "Notification";
        break;
      case DrawerScreenType.fire:
        titleAppbar = "Profile";
        break;
      case DrawerScreenType.setting:
        titleAppbar = "Settings";
        break;
    }

    return Text(
      titleAppbar,
      style: const TextStyle(fontStyle: FontStyle.normal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isTitle ? titleAppbarWidget : bodyWidget;
  }
}
