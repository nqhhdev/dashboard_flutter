import 'package:app_desktop/config/responsive.dart';
import 'package:app_desktop/presentation/common/common_drawer.dart';
import 'package:app_desktop/presentation/common/drawer.dart';
import 'package:flutter/material.dart';

class AppBarDesktop extends StatefulWidget {
  const AppBarDesktop({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<AppBarDesktop> createState() => _AppBarDesktopState();
}

class _AppBarDesktopState extends State<AppBarDesktop> {
  int navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // flex: 1,
                child: CommonDrawer(
                  paddingAllTotal: 1,
                  paddingRightAvatar: 1,
                  selectedIndex: navIndex,
                  setIndex: (selectedIndex) {
                    setState(() {
                      navIndex = selectedIndex;
                    });
                  },
                ),
              ),
            Expanded(
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
