import 'package:app_desktop/config/colors.dart';
import 'package:app_desktop/config/responsive.dart';
import 'package:app_desktop/presentation/screen/dashboard/widgets/my_fields.dart';
import 'package:app_desktop/presentation/screen/dashboard/widgets/recent_files.dart';
import 'package:app_desktop/presentation/screen/dashboard/widgets/storage_details.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: AppPadding.defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: AppPadding.defaultPadding),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: AppPadding.defaultPadding),
                      if (Responsive.isMobile(context)) const StarageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: AppPadding.defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                // if (!Responsive.isMobile(context))
                //   const Expanded(
                //     flex: 2,
                //     child: StarageDetails(),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
