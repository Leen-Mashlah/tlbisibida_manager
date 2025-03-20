import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/reponsiveness.dart';
import 'package:lambda_dent_dash/constant/components/top_nav.dart';
import 'package:lambda_dent_dash/view/cases/case_details_page.dart';
import 'package:lambda_dent_dash/view/clients/client_details_page.dart';
import 'package:lambda_dent_dash/view/inventory/inventory_page.dart';
import 'package:lambda_dent_dash/view/payments/payments_log_page.dart';

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
        largeScreen: ClientDetailsPage(),
      ),
    );
  }
}
