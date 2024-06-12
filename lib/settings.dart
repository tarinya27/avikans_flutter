import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:url_launcher/url_launcher.dart';

import 'package:avikances/updateprofile.dart';
import 'package:avikances/notificationView.dart'; 
import 'package:avikances/about.dart';
import 'package:avikances/welcome.dart';
import 'package:avikances/problem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('SETTINGS'),
        centerTitle: true,
        backgroundColor: Color(0xFF834d9b),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            trailing: ElevatedButton(
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateProfile()),
                );
              },
              child: Text('Update'),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.report_gmailerrorred),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Notifications'),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Report a Problem'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Problem()),
              );
              
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('Theme', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          SwitchListTile(
            title: const Text('Light'),
            value: isLightTheme,
            onChanged: (bool value) {
              setState(() {
                isLightTheme = value;
              });
            },
            secondary: const Icon(Icons.wb_sunny),
          ),
          SwitchListTile(
            title: const Text('Dark'),
            value: !isLightTheme,
            onChanged: (bool value) {
              setState(() {
                isLightTheme = !value;
              });
            },
            secondary: const Icon(Icons.nights_stay),
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoExample()),
              );
            },
          ),
        ],
      ),
    );
  }
}