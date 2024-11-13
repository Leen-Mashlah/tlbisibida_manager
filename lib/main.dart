import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/dio/dio.dart';
import 'package:lambda_dent_dash/navigation_controller.dart';
import 'package:lambda_dent_dash/routes.dart';
import 'package:lambda_dent_dash/view/authentication/authentication.dart';
import 'package:lambda_dent_dash/view/bills/bills_page.dart';
import 'package:lambda_dent_dash/view/cases/cases_list_page.dart';
import 'package:lambda_dent_dash/view/cases/case_details.dart';
import 'package:lambda_dent_dash/view/clients/client_details_page.dart';
import 'package:lambda_dent_dash/view/clients/clients_screen.dart';
import 'package:lambda_dent_dash/view/clients/clients_table.dart';
import 'package:lambda_dent_dash/view/site_layout.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: rootRoute,
      // unknownRoute: GetPage(
      //     name: '/not-found',
      //     page: () => const PageNotFound(),
      //     transition: Transition.fadeIn),
      getPages: [
        GetPage(
            name: rootRoute,
            page: () {
              return SiteLayout();
            }),
        GetPage(
            name: authenticationPageRoute, page: () => AuthenticationPage()),
      ],
      title: 'LambdaDent Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
        primaryColor: cyan300,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: cyan50,
      ),
      home: (CaseDetails()),
    );
  }
}
