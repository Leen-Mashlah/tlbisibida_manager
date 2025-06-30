import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/services/navigation/routes.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:lambda_dent_dash/services/navigation/navigation_service.dart';

Widget myPieMenu(NavigationService navigationService) {
  return PieMenu(
      theme: const PieTheme(
          tooltipCanvasAlignment: Alignment.centerRight,
          buttonThemeHovered:
              PieButtonTheme(backgroundColor: cyan300, iconColor: cyan600),
          pointerColor: Colors.transparent,
          overlayColor: Colors.transparent,
          delayDuration: Duration.zero,
          customAngle: 247 + 70,
          angleOffset: 10,
          spacing: 3,
          radius: 120,
          buttonSize: 38,
          buttonTheme: PieButtonTheme(
              iconColor: cyan_navbar_600, backgroundColor: cyan200)),
      actions: [
        PieAction(
            tooltip: const SizedBox(),
            onSelect: () {
              navigationService.navigateTo(clientsLogPageRoute);
            },
            child: const Icon(Icons.people_rounded)),
        PieAction(
          tooltip: const SizedBox(),
          onSelect: () {
            navigationService.navigateTo(clientsHistoryPageRoute);
          },
          child: const Icon(Icons.history_toggle_off_rounded),
        ),
        PieAction(
          tooltip: const SizedBox(),
          onSelect: () {
            navigationService.navigateTo(clientsReqPageRoute);
          },
          child: const Icon(Icons.add_task_rounded),
        ),
      ],
      child: const Icon(CupertinoIcons.circle_grid_hex_fill));
}
