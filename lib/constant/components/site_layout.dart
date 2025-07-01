import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/reponsiveness.dart';
import 'package:lambda_dent_dash/constant/components/top_nav.dart';
import 'package:lambda_dent_dash/services/Cache/cache_helper.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';
import 'package:lambda_dent_dash/services/navigation/navigation_service.dart';
import 'package:lambda_dent_dash/services/navigation/router.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';
import 'package:pie_menu/pie_menu.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      child: Scaffold(
        key: scaffoldKey,
        extendBodyBehindAppBar: false,
        appBar: const TopNavigationBar(),
        body: ResponsiveWidget(
          largeScreen: Navigator(
            key: locator<NavigationService>().navigatorKey,
            onGenerateRoute: generateRoute,
            initialRoute: CacheHelper.get('token') == '' ||
                    CacheHelper.get('tokeb') == null
                ? authenticationPageRoute
                : clientsLogPageRoute,
          ),
        ),
      ),
    );
  }
}
