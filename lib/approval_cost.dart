
import 'package:avikances/fixed_cost.dart';
import 'package:avikances/labor_cost.dart';
import 'package:avikances/materialcost.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CostApproval(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.25, size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CostApproval extends StatelessWidget {
  const CostApproval({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top right half circle
          Positioned(
            top: -35,
            right: -50,
            child: ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Color(0xFF834d9b),
              ),
            ),
          ),
          // Top left half circle
          Positioned(
            top: -35,
            left: -50,
            child: ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Color(0xFF834d9b),
              ),
            ),
          ),
          // Title "APPROVAL JOB COST"
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "APPROVAL JOB COST",
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 500,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/approval.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MaterialCost()));
                      },
                      child: Container(
                        width: 400,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 155, 107, 175),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            "Material cost",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LaborCost()));
                      },
                      child: Container(
                        width: 400,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 209, 132, 243),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            "Labor cost",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FixedCost()));
                      },
                      child: Container(
                        width: 400,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 91, 58, 107),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(
                          child: Text(
                            "Fixed cost",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
