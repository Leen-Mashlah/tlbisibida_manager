import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';
import 'package:lambda_dent_dash/presentation/clients_history/clients_his_page.dart';
import 'package:lambda_dent_dash/presentation/clients_log/clients_log_page.dart';
import 'package:lambda_dent_dash/presentation/clients_req/clients_req_page.dart';
// import 'package:flutter_web_dashboard/helpers/pages/Complaints/complaints.dart';
// import 'package:flutter_web_dashboard/helpers/pages/Conditions/conditions.dart';
// import 'package:flutter_web_dashboard/helpers/pages/Employees/employees.dart';
// import 'package:flutter_web_dashboard/helpers/pages/Files/files.dart';
// import 'package:flutter_web_dashboard/helpers/pages/Grades/grades.dart';
// import 'package:flutter_web_dashboard/helpers/pages/IncentiveShare/incentive_share.dart';
// import 'package:flutter_web_dashboard/helpers/pages/Incentives/incentives.dart';
// import 'package:flutter_web_dashboard/helpers/pages/Increment/Increment.dart';
// import 'package:flutter_web_dashboard/helpers/pages/clients/clients.dart';
// import 'package:flutter_web_dashboard/helpers/pages/drivers/drivers.dart';
// import 'package:flutter_web_dashboard/helpers/pages/overview/overview.dart';
// import 'package:flutter_web_dashboard/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');

  switch (settings.name) {
    case clientsLogPageRoute:
      return _getPageRoute((ClientsLogPage()));
    case clientsReqPageRoute:
      return _getPageRoute((ClientsReqPage()));
    case clientsHistoryPageRoute:
      return _getPageRoute((ClientsHistoryPage()));

    // case gradesPageRoute:
    //   return _getPageRoute(GradesPage());
    // case incrementPageRoute:
    //   return _getPageRoute(IncrementPage());
    // case complaintsPageRoute:
    //   return _getPageRoute(ComplaintsPage());
    // case conditionsPageRoute:
    //   return _getPageRoute(ConditionsPage());
    // case incentivePageRoute:
    //   return _getPageRoute(IncentivesPage());
    // case incentiveShareRoute:
    //   return _getPageRoute(IncentivesShare());
    // case filesPageRoute:
    //   return _getPageRoute(FilesPage());
    // case overviewPageRoute:
    //   return _getPageRoute(OverviewPage());
    // case driversPageRoute:
    //   return _getPageRoute(DriversPage());
    // case clientsPageRoute:
    //   return _getPageRoute(ClientsPage());
    default:
      return _getPageRoute(ClientsLogPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
