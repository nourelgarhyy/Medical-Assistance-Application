import 'package:flutter/material.dart';
import '../Models/medicine_details.dart';

class Meds extends ChangeNotifier {
  List<MedicineDeets> medslist = [
    MedicineDeets(id: '1', name: 'Stageron', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '2', name: 'Zestrile', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '3', name: 'Tenormine', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '4', name: 'Effox', dose: '1 pill', time: '9pm'),
    MedicineDeets(id: '5', name: 'Panadol', dose: '1 pill', time: '9pm'),
  ];

  addMedInList(String id, String name, String dose, String time) {
    final newMed = MedicineDeets(
      id: id,
      name: name,
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
      name: "panadol",
      dose: "400",
      time: "12/4",
    );
    medslist.add(newMed);
    notifyListeners();
  }
}
