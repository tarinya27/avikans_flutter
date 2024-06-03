import 'package:flutter/material.dart';

class Start_jobs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("jOBS VIEWS"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),

      body: Container(
         child:Image.asset("images/logo.png"),
      ),
    );
  }
}