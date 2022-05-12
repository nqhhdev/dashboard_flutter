import 'package:app_desktop/config/colors.dart';
import 'package:app_desktop/config/navigation_util.dart';
import 'package:app_desktop/presentation/main/main_screen.dart';
import 'package:app_desktop/presentation/screen/dashboard/dashboard_screen.dart';

import 'package:app_desktop/utils/route/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            defaultScale: true,
            minWidth: 480,
            defaultName: MOBILE,
            breakpoints: [
              const ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              const ResponsiveBreakpoint.resize(600, name: MOBILE),
              const ResponsiveBreakpoint.resize(850, name: TABLET),
              const ResponsiveBreakpoint.resize(1080, name: DESKTOP),
            ],
            background: Container(color: AppColors.bgColor));
      },
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[750],
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: AppColors.secondaryColor,
      ),
      navigatorKey: NavigationUtil.rootKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouting.generateRoute,
      home: const AppBarDesktop(
        child: DashboardScreen(),
      ),
    );
  }
}
