import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/my_pie_menu.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';
import 'package:lambda_dent_dash/services/navigation/navigation_service.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';

const double _logoEdgePadding = 16;
// About 14% smaller than the 56px slot it used to fill.
const double _logoSize = 48;

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavigationBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<NavigationService>();

    return ValueListenableBuilder(
      valueListenable: navigationService.currentTitle,
      builder: (context, title, _) => AppBar(
        foregroundColor: cyan_navbar_600,
        scrolledUnderElevation: 1,
        // Widen the leading slot by the padding so the logo area stays 56px.
        leadingWidth: kToolbarHeight + _logoEdgePadding,
        leading: Padding(
          // Physical right: the leading slot sits on the right edge in RTL.
          padding: const EdgeInsets.only(right: _logoEdgePadding),
          child: Align(
            // Keep the smaller logo anchored to the same right edge.
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/logo_v2.png',
              width: _logoSize,
              height: _logoSize,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(color: cyan500),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: cyan500),
        elevation: 0,
        backgroundColor: cyan100,
        // Notifications and the menu are only for authenticated pages.
        actions: [
          if (title != authenticationDisplayName)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
            ),
          if (title != authenticationDisplayName)
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10),
              child: myPieMenu(navigationService),
            ),
        ],
      ),
    );
  }
}
