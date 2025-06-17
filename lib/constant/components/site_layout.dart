import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/reponsiveness.dart';
import 'package:lambda_dent_dash/constant/components/top_nav.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';
import 'package:lambda_dent_dash/services/navigation/navigation_service.dart';
import 'package:lambda_dent_dash/services/navigation/router.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      appBar: topNavigationBar(context),
      body: ResponsiveWidget(
        largeScreen: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute: "/client_his",
        ),
      ),
    );
  }
}
