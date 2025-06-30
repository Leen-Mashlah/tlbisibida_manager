import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/presentation/clients_history/history_provider.dart';
import 'package:lambda_dent_dash/presentation/clients_log/log_provider.dart';
import 'package:lambda_dent_dash/presentation/clients_req/req_provider.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';
import 'package:lambda_dent_dash/services/navigation/navigation_service.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case clientsLogPageRoute:
      return _getPageRoute(LogProvider(), clientsLogDisplayName);
    case clientsReqPageRoute:
      return _getPageRoute(ReqProvider(), clientsReqDisplayName);
    case clientsHistoryPageRoute:
      return _getPageRoute(HistoryProvider(), clientsHistoryDisplayName);
    default:
      return _getPageRoute(LogProvider(), clientsLogDisplayName);
  }
}

PageRoute _getPageRoute(Widget child, String title) {
  locator<NavigationService>().currentTitle.value = title;
  return MaterialPageRoute(
    builder: (context) => child,
    settings: RouteSettings(name: title),
  );
}
