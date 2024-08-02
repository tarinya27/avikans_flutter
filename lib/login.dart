import 'dart:convert';
import 'dart:io';

import 'package:avikances/dash.dart';
import 'package:avikances/user.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';

// import 'Mysql.dart';

import 'package:avikances/admin_dashbord.dart';
import 'package:flutter/material.dart';
// import 'package:mysql_client/mysql_client.dart';
import 'package:http/http.dart' as http;

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final height = 300.0;
    const textStyle3 = TextStyle(
      color: Colors.grey,
    );
    const textStyle = textStyle3;
    const textStyle5 = TextStyle(
      color: Colors.grey,
    );
    const textStyle4 = textStyle5;
    const textStyle2 = textStyle4;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFC779D0), // Change border color as desired
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: height,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -40,
                        height: height + 40,
                        width: width,
                        child: fadeIn(
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateX(-0.1),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/cover1.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          duration: const Duration(seconds: 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      fadeIn(
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Color.fromRGBO(49, 39, 79, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        duration: const Duration(milliseconds: 1500),
                      ),
                      const SizedBox(height: 30),
                      fadeIn(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromRGBO(196, 135, 198, .3),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(196, 135, 198, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color.fromRGBO(247, 241, 247, 0.949),
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: textStyle,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: textStyle2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        duration: const Duration(milliseconds: 1700),
                      ),
                      const SizedBox(height: 20),
                      fadeIn(
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color.fromARGB(245, 51, 57, 230),
                              ),
                            ),
                          ),
                        ),
                        duration: const Duration(milliseconds: 1700),
                      ),
                      const SizedBox(height: 30),
                      fadeIn(
                        child: MaterialButton(
                          onPressed: login,
                          color: Color.fromARGB(245, 51, 57, 230),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        duration: const Duration(milliseconds: 1900),
                      ),
                      const SizedBox(height: 30),
                      fadeIn(
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                color: Color.fromARGB(245, 51, 57, 230),
                              ),
                            ),
                          ),
                        ),
                        duration: const Duration(milliseconds: 2000),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fadeIn({required Widget child, required Duration duration}) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Opacity(
          opacity: value as double,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value as double)),
            child: child!,
          ),
        );
      },
      child: child,
    );
  }

  Future<void> login() async {
    final String username = emailController.text;
    final String password = passwordController.text;
     final String url ="http://192.168.208.123:8080/api/v1";

    final response = await http.get(
      Uri.parse('$url/login/getUsernamePassword/$username/$password'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData = json.decode(response.body);

      if (responseData != null && responseData.containsKey('admin_type_id')) {

         final int adminType = responseData['admin_type_id'] as int;
        final String username = responseData['username'] as String;
     
        if (adminType == 1) {
          print(adminType);
          Navigator.push(
            context,
             
            MaterialPageRoute(builder: (context) => Dashbord(username: username)),
          );
        } else if (adminType == 2) {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context)=>Dash(username:username)),
          );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
              
          //   ),
          
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid admin type. Please contact support.'),
            ),
          );
        }
      
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid username or password. Please try again.'),
        ),
      );
    }
  }
}
