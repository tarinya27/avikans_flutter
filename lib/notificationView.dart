import 'package:avikances/admin_dashbord.dart';
import 'package:avikances/notifications.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  List<Notificationss> notifiy = allNotificaton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFF834d9b),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashbord()));
          },
        ),
        title: const Text("Notifications"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search Notifications",
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifiy.length,
              itemBuilder: (context, index) {
                final not = notifiy[index];

                return Container(
                  child: bulidNotification(not),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget bulidNotification(Notificationss not) => ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 25,
          child: Icon(Icons.notifications),
        ),
        isThreeLine: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(not.name, style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              not.time,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        subtitle: Text(
          not.reason,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        autofocus: true,
      );
}
