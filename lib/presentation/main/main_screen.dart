import 'package:app_desktop/config/colors.dart';
import 'package:app_desktop/config/responsive.dart';
import 'package:app_desktop/presentation/common/common_drawer.dart';
import 'package:app_desktop/presentation/common/drawer.dart';
import 'package:app_desktop/presentation/common/slide_menu.dart';
import 'package:app_desktop/presentation/screen/dashboard/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarDesktop extends StatefulWidget {
  const AppBarDesktop({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<AppBarDesktop> createState() => _AppBarDesktopState();
}

class _AppBarDesktopState extends State<AppBarDesktop> {
  int navIndex = 0;

  List<BottomNavigationBarItem> get listBottomItem => <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home),
          label: "home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home),
          label: "home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home),
          label: "home",
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
  
        title: DrawerBuilder(
          navIndex: navIndex,
          isTitle: true,
        ),
      ),
      drawer: Responsive.isDesktop(context)
          ? null
          : CommonDrawer(
              selectedIndex: navIndex,
              setIndex: (selectedIndex) {
                setState(() {
                  navIndex = selectedIndex;
                });
              },
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: CommonDrawer(
                  paddingAllTotal: 8,
                  paddingRightAvatar: 8,
                  selectedIndex: navIndex,
                  setIndex: (selectedIndex) {
                    setState(() {
                      navIndex = selectedIndex;
                    });
                  },
                ),
              ),
            Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: DrawerBuilder(
                  navIndex: navIndex,
                )),
          ],
        ),
      ),
    );
  }
}
