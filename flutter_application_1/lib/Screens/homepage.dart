import 'package:flutter/material.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../Models/reminder.dart';
import '../Providers/reminders_provider.dart';

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
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       showDialog(
        //         context: context,
        //         builder: (BuildContext context) => _PopupDialog(context),
        //       );
        //     },
        //     icon: Icon(Icons.add, size: 30),
        //   ),
        // ],
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
          _addReminder(context);
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

class CardList extends StatelessWidget {
  final Reminder reminders;
  int id;
  CardList(this.reminders, this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListTile(
          leading: Icon(Icons.check),
          title: Text(reminders.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reminders.dose),
              Text(reminders.time),
              Text(reminders.description),
            ],
          ),
          isThreeLine: true,
          trailing: IconButton(
              onPressed: () {
                print('Reminder Deleted');
                Provider.of<RemindersProvider>(context, listen: false)
                    .removeReminders(id);
              },
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}

_addReminder(BuildContext context) {
  final _name = TextEditingController();
  final _dose = TextEditingController();
  final _time = TextEditingController();
  final _description = TextEditingController();

  Widget okButton = TextButton(
    child: Text('Add Reminder'),
    onPressed: () {
      context
          .read<RemindersProvider>()
          .addReminders(_name.text, _dose.text, _time.text, _description.text);
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('ADD A REMINDER'),
    content: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _name,
            decoration: InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: _dose,
            decoration: InputDecoration(labelText: "Dose"),
          ),
          TextField(
            controller: _time,
            decoration: InputDecoration(labelText: "Time"),
          ),
          TextField(
            controller: _description,
            decoration: InputDecoration(labelText: "Description"),
          ),
        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
