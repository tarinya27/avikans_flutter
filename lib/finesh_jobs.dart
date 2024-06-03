import 'package:flutter/material.dart';
import 'dart:ui';

// Assuming `Finsh` is defined in 'finsh.dart'
import 'package:avikances/finsh.dart';

class FinshJobs extends StatelessWidget {
  final List<Finsh> jobs = allFinshJobs; // Assuming `allFinshJobs` is defined in 'finsh.dart'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFC779D0),
            ),
            // Scrolling content
            child: Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.only(top: kToolbarHeight),
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return Column(
                    children: [
                      buildLaborListTitle(job),
                    ],
                  );
                },
              ),
            ),
          ),
          // Transparent AppBar with background blending
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: AppBar(
                    title: Text("Finish Jobs"),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLaborListTitle(Finsh job) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(235, 11, 10, 10),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(job.jobs),
        subtitle: Text("Status: ${job.status}"),
        trailing: Text("Date: ${job.Date}"), // Assuming the correct property is `date`
        textColor: Colors.black,
      ),
    );
  }
}
