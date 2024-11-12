import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/view/inventory/pie_chart.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InteractiveDonutChart(),
    );
  }
}
