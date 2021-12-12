import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/meds.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Widgets/medicines_view.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({Key? key}) : super(key: key);
  static const routeName = '/medicineList';

  get menuBar => MenuBar();
  get nav => Navigation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine List"),
        backgroundColor: Color(0xff92C9D4),
        centerTitle: true,
      ),
      bottomNavigationBar: nav, //Navigation Bar
      drawer: menuBar,
      body: MedicinesWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAlertDialog(context);

          //Provider.of<Meds>(context, listen: false).addMedInList2();
        },
      ),
    );
  }
}
