import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutUsPage(),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  final List<String> companyPoints = [
    "Nexon Asia Pacific’s exclusive offshore resource center-based from Sri Lanka.",
    "Provider and manager of resources from our Offshore center located in Ratmalana, Sri Lanka, in close proximity to the National Water Supply.",
    "Provide opportunities to further knowledge and careers while being a part of Nexon.",
    "Services include a wide range of career fields from IT to Finance and Administration sectors."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/about.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                centerTitle: true,
                title: Text(
                  'ABOUT US',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: companyPoints.length,
                  itemBuilder: (context, index) {
                    return CompanyPoint(
                      text: companyPoints[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CompanyPoint extends StatelessWidget {
  final String text;

  const CompanyPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left, // Align text to the left
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
