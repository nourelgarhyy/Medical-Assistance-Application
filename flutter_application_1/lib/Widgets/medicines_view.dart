import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/meds.dart';
import 'one_med.dart';
import 'package:provider/provider.dart' as provider;

class MedicinesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medData = provider.Provider.of<Meds>(context);
    final medications = medData.medicationList;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Container(
          width: 250,
          child: ListView.builder(
            itemCount: medications.length,
            itemBuilder: (ctx, i) => OneMed(
              medications[i],
              i,
            ),
          ),
        ),
      ),
    );
  }
}
