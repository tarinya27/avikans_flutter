import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: StartJobs(),
  ));
}

class Employee {
  final String name;
  final List<Job> jobs;

  Employee(this.name, this.jobs);

  factory Employee.fromJson(Map<String, dynamic> json) {
    var jobsFromJson = json['jobs'] as List;
    List<Job> jobsList = jobsFromJson.map((i) => Job.fromJson(i)).toList();

    return Employee(json['name'], jobsList);
  }
}

class Job {
  final String title;
  DateTime startTime;
  DateTime endTime;

  Job(this.title, this.startTime, this.endTime);

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      json['title'],
      DateTime.parse(json['startTime']),
      DateTime.parse(json['endTime']),
    );
  }
}

Future<List<Employee>> fetchEmployees() async {
  // Simulate a network call
  await Future.delayed(Duration(seconds: 2));

  String jsonString = '''
  [
    {
      "name": "Tarinya",
      "jobs": [
        {"title": "Painting", "startTime": "2024-06-07T09:00:00", "endTime": "2024-06-07T10:00:00"},
        {"title": "Cleaning", "startTime": "2024-06-07T10:30:00", "endTime": "2024-06-07T11:30:00"}
      ]
    },
    {
      "name": "Shamith",
      "jobs": [
        {"title": "Reporting", "startTime": "2024-06-07T11:00:00", "endTime": "2024-06-07T12:00:00"},
        {"title": "Inventory", "startTime": "2024-06-07T13:00:00", "endTime": "2024-06-07T14:00:00"}
      ]
    }
  ]
  ''';

  List<dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse.map((employee) => Employee.fromJson(employee)).toList();
}

class StartJobs extends StatefulWidget {
  @override
  _StartJobsState createState() => _StartJobsState();
}

class _StartJobsState extends State<StartJobs> {
  late Future<List<Employee>> futureEmployees;

  @override
  void initState() {
    super.initState();
    futureEmployees = fetchEmployees();
  }

  String formatTimeRange(DateTime startTime, DateTime endTime) {
    String date = DateFormat('yyyy-MM-dd').format(startTime);
    String start = DateFormat('hh:mm a').format(startTime);
    String end = DateFormat('hh:mm a').format(endTime);
    return '$date    $start - $end';
  }

  Future<DateTime?> _selectTime(BuildContext context, DateTime initialTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialTime),
    );
    if (picked != null) {
      return DateTime(
        initialTime.year,
        initialTime.month,
        initialTime.day,
        picked.hour,
        picked.minute,
      );
    }
    return null;
  }

  void _updateJobTimes(List<Job> jobs, int updatedIndex, DateTime newEndTime) {
    setState(() {
      jobs[updatedIndex].endTime = newEndTime;

      for (int i = updatedIndex + 1; i < jobs.length; i++) {
        jobs[i].startTime = jobs[i - 1].endTime;
        jobs[i].endTime = jobs[i].startTime.add(Duration(hours: 1)); // Assuming each job lasts 1 hour for simplicity
      }
    });
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
                title: Text('DAILY JOBS'),
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
                child: FutureBuilder<List<Employee>>(
                  future: futureEmployees,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No data available'));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: snapshot.data!.map((employee) {
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
                                        int jobIndex = employee.jobs.indexOf(job);
                                        return ListTile(
                                          title: Text(
                                            job.title,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Text(
                                            formatTimeRange(job.startTime, job.endTime),
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(Icons.update),
                                            onPressed: () async {
                                              DateTime? newEndTime = await _selectTime(context, job.endTime);
                                              if (newEndTime != null) {
                                                _updateJobTimes(employee.jobs, jobIndex, newEndTime);
                                              }
                                            },
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
                      );
                    }
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
