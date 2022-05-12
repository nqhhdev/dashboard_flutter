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
  dashboard,
  transaction,
  task,
  documents,
  store,
  notification,
  profile,
  setting,
}

extension DrawerEnum on DrawerScreenType {
  IconData get icon {
    switch (this) {
      case DrawerScreenType.dashboard:
        return Icons.dashboard;
      case DrawerScreenType.transaction:
        return Icons.transcribe;
      case DrawerScreenType.task:
        return Icons.task;
      case DrawerScreenType.documents:
        return Icons.document_scanner;
      case DrawerScreenType.store:
        return Icons.store;
      case DrawerScreenType.notification:
        return Icons.notification_add;
      case DrawerScreenType.profile:
        return Icons.person_off_outlined;
      case DrawerScreenType.setting:
        return Icons.settings;
    }
  }

  String get title {
    switch (this) {
      case DrawerScreenType.dashboard:
        return "Dashboard";
      case DrawerScreenType.transaction:
        return "Transaction";

      case DrawerScreenType.task:
        return "Task";

      case DrawerScreenType.documents:
        return "Documents";

      case DrawerScreenType.store:
        return "Store";

      case DrawerScreenType.notification:
        return "Notification";

      case DrawerScreenType.profile:
        return "Profile";

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
      case DrawerScreenType.dashboard:
        return DashboardRoute.route;
      case DrawerScreenType.transaction:
        return TransactionRoute.route;
      case DrawerScreenType.task:
        return TaskRoute.route;
      case DrawerScreenType.documents:
        return DocumentsRoute.route;
      case DrawerScreenType.store:
        return StoreRoute.route;
      case DrawerScreenType.notification:
        return NotificationRoute.route;
      case DrawerScreenType.profile:
        return ProfileRoute.route;
      case DrawerScreenType.setting:
        return SettingsRoute.route;
    }
  }

  Widget get titleAppbarWidget {
    String titleAppbar = "";
    switch (drawerScreenType) {
      case DrawerScreenType.dashboard:
        titleAppbar = "Dashboard";
        break;
      case DrawerScreenType.transaction:
        titleAppbar = "Transaction";
        break;
      case DrawerScreenType.task:
        titleAppbar = "Task";
        break;
      case DrawerScreenType.documents:
        titleAppbar = "Documents";
        break;
      case DrawerScreenType.store:
        titleAppbar = "Store";
        break;
      case DrawerScreenType.notification:
        titleAppbar = "Notification";
        break;
      case DrawerScreenType.profile:
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
