import 'package:flutter/cupertino.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final ValueNotifier<String> currentTitle =
      ValueNotifier(clientsLogDisplayName);

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateNavigationState();
    });
  }

  Future<dynamic> navigateTo(String routeName) {
    final title = _getTitleForRoute(routeName);
    currentTitle.value = title;
    return navigatorKey.currentState!.pushReplacementNamed(routeName).then((_) {
      updateNavigationState();
    });
  }

  void goBack() {
    navigatorKey.currentState!.pop();
    updateNavigationState();
  }

  void updateNavigationState() {
    final currentContext = navigatorKey.currentContext;
    if (currentContext == null) return;

    final currentRoute = ModalRoute.of(currentContext);
    if (currentRoute != null) {
      final routeName = currentRoute.settings.name;
      if (routeName != null && routeName.isNotEmpty && routeName != '/') {
        currentTitle.value = routeName;
      } else {
        // currentTitle.value = authenticationDisplayName;
      }
    }
  }

  String _getTitleForRoute(String routeName) {
    switch (routeName) {
      case clientsLogPageRoute:
        return clientsLogDisplayName;
      case clientsReqPageRoute:
        return clientsReqDisplayName;
      case clientsHistoryPageRoute:
        return clientsHistoryDisplayName;
      case authenticationPageRoute:
        return authenticationDisplayName;

      default:
        return authenticationPageRoute;
    }
  }
}
