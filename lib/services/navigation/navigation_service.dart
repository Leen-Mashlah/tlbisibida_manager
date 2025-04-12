import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationService {
  // static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
