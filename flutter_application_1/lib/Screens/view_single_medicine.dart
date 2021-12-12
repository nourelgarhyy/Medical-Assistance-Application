import 'package:flutter/material.dart';
import 'package:health_care_app/Models/medicine_details.dart';
import 'package:health_care_app/Providers/meds.dart';
import 'package:health_care_app/Widgets/one_med.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

const roundBorder = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white);

@override
class ViewMed extends StatelessWidget {
  int index;
  ViewMed({Key? key, required this.index}) : super(key: key);
  get nav => Navigation();
  get menuBar => MenuBar();
  Widget build(BuildContext context) {
    // final med = Provider.of<MedicineDeets>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF92C9D4),
      ),
      body: ViewMedicineCard(
        index: index,
      ),
      bottomNavigationBar: nav, //Navigation Bar
      drawer: menuBar,
    );
  }
}

class ViewMedicineCard extends StatelessWidget {
  int index;
  ViewMedicineCard({Key? key, required this.index}) : super(key: key);
  Widget build(BuildContext context) {
    final medData = Provider.of<Meds>(context);
    final medications = medData.medicationList;
    return Scaffold(
      body: ListView(children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_drop_down_circle),
                title: Text(medications[index].getName),
                subtitle: Text(
                  medications[index].getTime,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  medications[index].getDose,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      showAlertDialog(context);
                    },
                    child: const Text('Edit Timing'),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      Provider.of<Meds>(context, listen: false)
                          .deleteMed(medications[index].getID);
                    },
                    child: const Text(
                      'Remove',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Image.asset('assets/Medicine.png'),
            ],
          ),
        ),
      ]),
    );
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _NewTime = TextEditingController();

  // Create button
  Widget okButton = TextButton(
    child: Text("Ok"),
    onPressed: () {
      Provider.of<Meds>(context, listen: false).editTiming(_NewTime.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Edit timing"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _NewTime,
          decoration: InputDecoration(hintText: "Enter new timing"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
