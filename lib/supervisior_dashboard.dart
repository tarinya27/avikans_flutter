import 'package:flutter/material.dart';
import 'package:avikances/view_jobs.dart';
import 'package:avikances/working_jobs.dart';
import 'package:avikances/settings.dart'; 
import 'package:avikances/notificationView.dart'; 
import 'package:avikances/notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supervision Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SupervisiorDashboard(),
    );
  }
}

class SupervisiorDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Static job counts
    final int finishJobs = 400;
    final int incompleteJobs = 50;
    final int inprogressJobs = 4;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/girl.jpg'), // change avater here
                          radius: 30,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, Tarinya!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Welcome to the Supervision Dashboard',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('Finish Jobs', finishJobs.toString()),
                    _buildStatCard('Incomplete Jobs', incompleteJobs.toString()),
                    _buildStatCard('In progress Jobs', inprogressJobs.toString()),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        title: 'Task Overview',
                        subtitle: 'View Progression',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WorkingJobs()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: CustomCard(
                        title: 'Task Overview',
                        subtitle: 'View Jobs',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListViews()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TransactionCards(), // Add TransactionCards widget
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap; // Add onTap parameter

  CustomCard({required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 150, // change height for both cards
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, //change background color
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionCard(
          image: AssetImage('images/settings.png'),
          title: "Settings",
          onTap: () {
           Navigator.push(
              context,
             MaterialPageRoute(builder: (context) => Settings()), // Navigate to settings.dart
            );
          },
        ),
        TransactionCard(
          image: AssetImage('images/bell.png'),
          title: "Notifications",
          onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Notifications()),
           );
          },
        ),
      ],
    );
  }
}

class TransactionCard extends StatelessWidget {
  final ImageProvider image; 
  final String title;
  final Function onTap;

  TransactionCard({
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image(image: image, width: 32, height: 32), 
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}