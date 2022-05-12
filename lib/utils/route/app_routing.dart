import 'package:app_desktop/presentation/screen/dashboard/dashboard_route.dart';
import 'package:app_desktop/presentation/screen/documents/documents_route.dart';
import 'package:app_desktop/presentation/screen/notification/notification_route.dart';
import 'package:app_desktop/presentation/screen/profile/profile_route.dart';
import 'package:app_desktop/presentation/screen/settings/settings_route.dart';
import 'package:app_desktop/presentation/screen/store/store_route.dart';
import 'package:app_desktop/presentation/screen/task/task_route.dart';
import 'package:app_desktop/presentation/screen/transaction/transaction_route.dart';
import 'package:flutter/material.dart';

enum RouteDefine {
  dashboard,
  transaction,
  task,
  documents,
  store,
  notification,
  profile,
  setting,
}

class AppRouting {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      ///ADD ROUTE
      RouteDefine.dashboard.name: (_) => DashboardRoute.route,
      RouteDefine.transaction.name: (_) => TransactionRoute.route,
      RouteDefine.task.name: (_) => TaskRoute.route,
      RouteDefine.documents.name: (_) => DocumentsRoute.route,
      RouteDefine.store.name: (_) => StoreRoute.route,
      RouteDefine.notification.name: (_) => NotificationRoute.route,
      RouteDefine.profile.name: (_) => ProfileRoute.route,
      RouteDefine.setting.name: (_) => SettingsRoute.route,
    };

    final routeBuilder = routes[settings.name];

    return MaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }
}
