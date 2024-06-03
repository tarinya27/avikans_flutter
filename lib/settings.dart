import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),

      body: Container(
         child:Image.asset("images/settings.png"),
      ),
    );
  }
}