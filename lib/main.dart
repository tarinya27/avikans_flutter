
import 'package:avikances/notificationView.dart';
import 'package:avikances/notifications.dart';
import 'package:avikances/admin_dashbord.dart';
import 'package:avikances/approval_cost.dart';
import 'package:avikances/login.dart';
import 'package:avikances/note.dart';
import 'package:avikances/start_jobs.dart';
import 'package:flutter/material.dart';
import 'package:avikances/fixed_cost.dart';




main() { 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),

      //home: FormScreen(),
      // home: Notes(),
      // home: Start_jobs(),
      //home: SupervisiorDashboard(),
      //home: Dashbord(),
      //home: Notifications(),
        //home: FixedCost(),
        home: HomePage(),



    );
  }
}

