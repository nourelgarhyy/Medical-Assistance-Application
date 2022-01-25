import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';

const primaryColor = Color(0xFF92C9D4);
const q = TextStyle(fontWeight: FontWeight.bold);
const a = TextStyle(color: Colors.grey);
const roundBorder = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white);

// This widget is the root of your application.
@override
class Help extends StatelessWidget {
  get nav => Navigation();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        backgroundColor: Color(0xff053F5E),
      ),
      body: Items(),
      bottomNavigationBar: nav,
    );
  }
}

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                height: 149,
                width: 323,
                decoration: roundBorder,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "How to Add Reminders?",
                      style: q,
                    ),
                    Text(
                        "Press the plus sign in the Homepage and add reminder details then click save.",
                        style: a),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 149,
                width: 323,
                decoration: roundBorder,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "How to Add Contacts?",
                      style: q,
                    ),
                    Text(
                        "Navigate to the Add Emergency contacts page and fill out the requested data then click save.",
                        style: a),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 149,
              width: 323,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),

// This widget is the root of your application.,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("medicare@gmail.com",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
