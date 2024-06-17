import 'package:flutter/material.dart';
import 'package:avikances/working_jobs.dart';
import 'package:avikances/view_jobs.dart';
import 'package:avikances/settings.dart';
import 'package:avikances/note.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dash(),
    );
  }
}

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          
          },
        ),
        title: Text(
          'Supervisor Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFC779D0),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.build, color: Colors.black),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/girl.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'HI TARINYA!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to the Supervision Dashboard',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(20.0),
              children: [
                _buildGridItem(Icons.query_stats, 'View Progress', context,WorkingJobs()),
                _buildGridItem(Icons.receipt, 'View Jobs', context, ListViews()),
                _buildGridItem(Icons.camera, 'Capture a work', context, Notes(title: '',)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title, BuildContext context, [Widget? screen]) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specified screen
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Color(0xFFC779D0)),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}
