import 'package:flutter/cupertino.dart';
import 'package:lambda_dent_dash/controllers.dart';
import 'package:lambda_dent_dash/router.dart';
import 'package:lambda_dent_dash/routes.dart';


Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: homePageRoute,
    );
