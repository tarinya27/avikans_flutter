// import 'package:app/fixed.dart';
import 'package:avikances/fixed.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FixedCost extends StatefulWidget {
  @override
  _FixedCostState createState() => _FixedCostState();
}

class _FixedCostState extends State<FixedCost>{
  late Future<List<Fix>> _fixed;

  @override
  void initState() {
    super.initState();
    _fixed = fetchFixed();
  }

  Future<List<Fix>> fetchFixed() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2/api/v1/fixed/fixed'));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Fix> materials =
          body.map((dynamic item) => Fix.fromJson(item)).toList();
      return materials;
    } else {
      throw 'Failed to load materials';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fixed Cost"),
          centerTitle: true,
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),

         body: FutureBuilder<List<Fix>>(
        future: _fixed,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Fix fix = snapshot.data![index];
                return Slidable(
                  startActionPane: ActionPane(
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.green,
                        icon: Icons.approval,
                        label: 'Approval',
                        onPressed: (context) =>
                            onDismissed(), // Implement your approval logic here
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.red,
                        icon: Icons.restore_from_trash_outlined,
                        label: 'Reject',
                        onPressed: (context) {
                          // Implement your rejection logic here
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Confirmation'),
                              content: Text('Are you sure you want to reject?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                    // Add your rejection logic here
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Reason"),
                                        content: TextFormField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            labelText: "Add reason",
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.note_add),
                                          ),
                                          validator: (value) {},
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Send Reason'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text('No'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  child: ListTile(
                    // title: Text(fix.jobid),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("JobID: ${fix.jobid}"),

                        Text("Depatment:${fix.dept_id}"),
                        Text("Fixed Type: ${fix.fixed_type}"),
                        Text("Rate: ${fix.rate}"),
                        
                      ],
                    ),
                    trailing: Text("Amount: ${fix.amount}"),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  onDismisseds() {}

  onDismissed() {}




}