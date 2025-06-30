import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/presentation/clients_history/history_provider.dart';
import 'package:lambda_dent_dash/presentation/clients_log/log_provider.dart';
import 'package:lambda_dent_dash/presentation/clients_req/req_provider.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case clientsLogPageRoute:
      return _getPageRoute(LogProvider());
    case clientsReqPageRoute:
      return _getPageRoute((ReqProvider()));
    case clientsHistoryPageRoute:
      return _getPageRoute((HistoryProvider()));
    default:
      return _getPageRoute(LogProvider());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
