import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/view/clients/components/clients_table.dart';
import 'package:lambda_dent_dash/view/clients/components/clients_table_req.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              ClientsReqTable(),
            ],
          )),
        ],
      ),
    ));
  }
}
