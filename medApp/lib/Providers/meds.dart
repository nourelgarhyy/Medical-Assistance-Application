import 'package:flutter/material.dart';
import '../Models/medicine_details.dart';

class Meds extends ChangeNotifier {
  List<MedicineDeets> medslist = [
    MedicineDeets(id: '1', med: 'Stageron', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '2', med: 'Zestrile', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '3', med: 'Tenormine', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '4', med: 'Effox', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '5', med: 'Panadol', dose: '1 pill', time: '9pm'),
  ];

  addMedInList(String id, String name, String dose, String time) {
    final newMed = MedicineDeets(
      id: id,
      med: name,
      dose: dose,
      time: time,
    );
    medslist.add(newMed);
    notifyListeners();
  }

  List<MedicineDeets> get medicationList => [...medslist];

  void deleteMed(String id) {
    medslist.removeWhere((med) => med.id == id);
    notifyListeners();
  }

  addMedInList2() {
    final newMed = MedicineDeets(
      id: "5",
      med: "panadol",
      dose: "400",
      time: "12/4",
    );
    medslist.add(newMed);
    notifyListeners();
  }

  editTiming(time) {
    time = time;
    notifyListeners();
  }
}
