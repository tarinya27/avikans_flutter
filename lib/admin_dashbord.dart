// ignore_for_file: prefer_const_constructors

// import 'dart:js';

// import 'dart:html';

// import 'dart:html';

import 'package:avikances/settings.dart';
import 'package:avikances/approval_cost.dart';
import 'package:avikances/finesh_jobs.dart';
import 'package:avikances/notificationView.dart';
import 'package:avikances/working_jobs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:avikances/start_jobs.dart';

class Dashbord extends StatelessWidget {
 final String username;

  const Dashbord({Key? key, required this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
    theme: ThemeData(primarySwatch: Colors.deepPurple), // Set primarySwatch to deepPurple,
      home: DashbordHome(username :username),
    );
  }
}

class DashbordHome extends StatelessWidget {
   final String username;

  const DashbordHome({Key? key, required this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    "Hi $username",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: const Color.fromARGB(255, 16, 16, 16)),
                  ),
                  subtitle: Text(
                    "Welcome to the admin dashboard",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: const Color.fromARGB(255, 16, 16, 16)),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("images/man.png"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColorLight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 70),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 50,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkingJobs()));
                    },
                    child: itemDashboard(
                      'Working Jobs',
                      CupertinoIcons.person_2,
                      Colors.deepOrangeAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CostApproval()));
                    },
                    child: itemDashboard(
                      'Approved Cost',
                      CupertinoIcons.money_dollar,
                      Color.fromARGB(255, 236, 219, 59),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartJobs()));
                    },
                    child: itemDashboard(
                      'Day Close',
                      CupertinoIcons.calendar_badge_minus,
                      Colors.brown,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinshJobs()));
                    },
                    child: itemDashboard(
                      'Finish Jobs',
                      CupertinoIcons.doc_append,
                      Colors.amber,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>SettingsPage())); //setting
                    },
                    child: itemDashboard(
                      'Settings',
                      CupertinoIcons.settings,
                      Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()));
                    },
                    child: itemDashboard(
                      'Notifications',
                      CupertinoIcons.bell,
                      Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemDashboard(String title, iconData, Color background) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  // color: ,
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title)
          ],
        ),
      );
}
