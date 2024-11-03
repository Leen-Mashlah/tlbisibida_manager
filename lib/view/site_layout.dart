import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/view/home_page.dart';
import 'package:lambda_dent_dash/view/reponsiveness.dart';
import 'package:lambda_dent_dash/view/top_nav.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: topNavigationBar(context),
      body: ResponsiveWidget(
        largeScreen: HomePage(),
      ),
    );
  }
}
