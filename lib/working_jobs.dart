import 'package:flutter/material.dart';
// Removed unnecessary imports
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class WorkingJobs extends StatelessWidget {
  final List<String> jobs = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  void _addJobs() {
    jobs.insert(0, "Jobs ${jobs.length}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Working Jobs"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC779D0), Color(0xFF834d9b)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC779D0), Color(0xFF834d9b)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ProgressBarList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addJobs,
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFB993D6),
      ),
    );
  }
}

class ProgressBarList extends StatelessWidget {
  final List<ProgressData> dataList = [
    ProgressData(label: 'Job 1', text: "Shamith Udayanga", percentage: 0.7),
    ProgressData(label: 'Job 2', text: "Shamith Udayanga", percentage: 0.3),
    ProgressData(label: 'Job 3', text: "Shamith Udayanga", percentage: 0.5),
    ProgressData(label: 'Job 4', text: "Shamith Udayanga", percentage: 0.2),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ProgressBarListItem(data: dataList[index]),
        );
      },
    );
  }
}

class ProgressBarListItem extends StatelessWidget {
  final ProgressData data;

  ProgressBarListItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(data.text),
            SizedBox(height: 20),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: data.percentage,
                    minHeight: 20,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB993D6)),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '${(data.percentage * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressData {
  final String label;
  final String text;
  final double percentage;

  ProgressData({required this.label, required this.percentage, required this.text});
}
