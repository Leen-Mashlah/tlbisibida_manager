import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';

AppBar topNavigationBar(BuildContext context) =>
    AppBar(
      scrolledUnderElevation: 1,
      leading: Image.asset('assets/logo_v2.png',width: 32,height: 32,),
      title: Text('data,'),
      iconTheme: const IconThemeData(color: cyan500),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {
            // Navigate to settings screen
           // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
          },
          icon: const Icon(Icons.settings,),
        ),
        IconButton(
          onPressed: () {
            // Navigate to help screen
           // Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
          },
          icon: const Icon(Icons.person, ),
        ),
        IconButton(
          onPressed: () {
            // Navigate to about screen
         //   Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
          },
          icon: const Icon(Icons.notifications_none_rounded,  ),
        ),
      ],
    );
