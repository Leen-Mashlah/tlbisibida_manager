import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/view/clients/clients_table.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Expanded(child: SingleChildScrollView(child: ClientsTable())));
  }
}
