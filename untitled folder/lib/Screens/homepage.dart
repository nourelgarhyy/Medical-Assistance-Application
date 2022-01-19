import 'package:flutter/material.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Widgets/add_reminder_widget.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../Models/reminder.dart';
import '../Providers/reminders_provider.dart';
import 'package:health_care_app/Widgets/add_reminder_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get nav => Navigation();
  get menuBar => MenuBar();
  String? drawerName;

  void initState() {
    super.initState();
    getUserData();
  }

  Future getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    drawerName = prefs.getString('username') ?? 'no name found';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome, $drawerName'),
        backgroundColor: Color(0xff92C9D4),
      ),
      bottomNavigationBar: nav, //Navigation Bar
      drawer: menuBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<RemindersProvider>(
          builder: (context, RemindersProvider data, child) {
            return data.getReminders.length != 0
                ? ListView.builder(
                    itemCount: data.getReminders.length,
                    itemBuilder: (context, id) {
                      return CardList(data.getReminders[id], id);
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Center(
                      child: Text('No Reminders Yet'),
                    ),
                  );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddReminderDialog().addReminder(context);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
