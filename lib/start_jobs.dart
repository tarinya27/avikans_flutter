import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(
    home: StartJobs(),
  ));
}

class Employee {
  final String name;
  final List<Job> jobs;

  Employee(this.name, this.jobs);
}

class Job {
  final String title;
  DateTime? timeIn;
  DateTime? timeOut;

  Job(this.title, {this.timeIn, this.timeOut});
}

class StartJobs extends StatefulWidget {
  @override
  _StartJobsState createState() => _StartJobsState();
}

class _StartJobsState extends State<StartJobs> {
  List<Employee> employees = [
    Employee('Tarinya', [Job('Task 1'), Job('Task 2')]),
    Employee('Shamith', [Job('Task 1'), Job('Task 2')]),
    Employee('Shaveen', [Job('Task 1'), Job('Task 2')]),
    Employee('Gevin', [Job('Task 1'), Job('Task 2')]),
    Employee('Ruwan', [Job('Task 1'), Job('Task 2')]),
    Employee('Imesh', [Job('Task 1'), Job('Task 2')]),
    Employee('Moksha', [Job('Task 1'), Job('Task 2')]),
    Employee('Sakeethiya', [Job('Task 1'), Job('Task 2')]),
  ];

  String formatTime(DateTime? time) {
    if (time == null) return 'N/A';
    return DateFormat('yyyy-MM-dd   hh:mm a').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/wall.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                centerTitle: true,
                title: Text('Daily Jobs'),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: employees.map((employee) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  employee.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                children: employee.jobs.map((job) {
                                  return ListTile(
                                    title: Text(
                                      job.title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Time In: ${formatTime(job.timeIn)}\nTime Out: ${formatTime(job.timeOut)}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.play_arrow, color: Colors.black),
                                          onPressed: () {
                                            setState(() {
                                              job.timeIn = DateTime.now();
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.stop, color: Colors.black),
                                          onPressed: () {
                                            setState(() {
                                              job.timeOut = DateTime.now();
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.clear, color: Colors.black),
                                          onPressed: () {
                                            setState(() {
                                              job.timeIn = null;
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.clear_all, color: Colors.black),
                                          onPressed: () {
                                            setState(() {
                                              job.timeOut = null;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
