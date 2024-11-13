import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/ninja_star_shape.dart';
import 'package:lambda_dent_dash/view/cases/cases_list_page.dart';
import 'package:lambda_dent_dash/view/home_page.dart';
import 'package:lambda_dent_dash/view/local_navigator.dart';
import 'package:lambda_dent_dash/view/reponsiveness.dart';
import 'package:lambda_dent_dash/view/top_nav.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context),
      body: ResponsiveWidget(
        largeScreen: CasesListPage(),
      ),
    );
  }
}
