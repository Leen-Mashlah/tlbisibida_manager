import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/payments/payments_log_page.dart';
import 'package:lambda_dent_dash/constant/components/reponsiveness.dart';
import 'package:lambda_dent_dash/constant/components/top_nav.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      appBar: topNavigationBar(context),
      body: const ResponsiveWidget(
        largeScreen: PaymentsLogPage(),
      ),
    );
  }
}
