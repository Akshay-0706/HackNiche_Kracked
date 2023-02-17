import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  FirebaseDatabase databaseRef = FirebaseDatabase.instance;

  var data;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  // getData() {
  //   Future.wait([
  //     Database.getDrives(databaseRef),
  //   ]).then((value) {
  //     setState(() {
  //       data = value;
  //       print('sss');
  //       print(data[0]['title']);
  //     });
  //   });
  // }

  getData() async {
    // data = await Database.getDrives(databaseRef);

    setState(() {
      print('sss');
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff00332b),
        body: data == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FirebaseAnimatedList(
                      physics: const BouncingScrollPhysics(),
                      query: databaseRef
                          .ref('Community')
                          .orderByChild('timestamp'),
                      sort: (a, b) {
                        Map user1 = a.value as Map;
                        Map user2 = b.value as Map;
                        return DateTime.parse(user1['timestamp'])
                                .isAfter(DateTime.parse(user2['timestamp']))
                            ? -1
                            : 1;
                      },
                      itemBuilder: ((context, snapshot, animation, index) {
                        return buildNotiCard(context, snapshot.value);
                      }),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

buildNotiCard(context, data) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(15)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(data['img'] ??
                  'https://cdn1.vectorstock.com/i/1000x1000/98/30/eco-friendly-poster-vector-3429830.jpg'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              data['title'],
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 169, 195, 196)),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              DateFormat.jm().format(DateTime.parse(data['timestamp'])),
              // . toString(),
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 169, 195, 196)),
            ),
          ],
        ),
        SizedBox(
          height: 19,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['title'],
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(
                  height: 2,
                ),
                Text(data['desc']),
              ],
            ),
            // Text(data['category'])
          ],
        )
      ],
    ),
  );
}
