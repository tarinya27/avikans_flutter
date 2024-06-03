import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViews(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListViews extends StatelessWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top left half circle
          Positioned(
            top: -35,
            left: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFB993D6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom right half circle
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFB993D6),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Title "VIEW JOBS"
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "VIEW JOBS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // ListView containing job items
          Positioned(
            top: 50, // Adjust this value according to your needs
            bottom: 0,
            left: 0,
            right: 0,
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                ListTile(
                  title: Text("View Jobs"),
                  subtitle: Text("j001 :Brass"),
                  trailing: Icon(Icons.add),
                  onTap: () {},
                  tileColor: const Color.fromARGB(255, 241, 239, 239),
                ),
                ListTile(
                  title: Text("View Jobs"),
                  subtitle: Text("j002 :Brass"),
                  trailing: Icon(Icons.add),
                  onTap: () {},
                  tileColor: const Color.fromARGB(255, 241, 239, 239),
                ),
                ListTile(
                  title: Text("View Jobs"),
                  subtitle: Text("j003 :Brass"),
                  trailing: Icon(Icons.add),
                  onTap: () {},
                  tileColor: const Color.fromARGB(255, 241, 239, 239),
                ),
                // Repeat the ListTile for each job as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
