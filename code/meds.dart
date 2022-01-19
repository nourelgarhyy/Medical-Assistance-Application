import 'package:flutter/material.dart';
import '../Models/medicine_details.dart';

class Meds extends ChangeNotifier {
  List<MedicineDeets> medslist = [
    MedicineDeets(id: '1', name: 'Stageron', description: 'https://www.medicines.org.uk/emc/product/1529/smpc#gref', imageUrl: 'https://www.westend61.de/images/0000056568pw/white-pill-close-up-THF00831.jpg'),
    MedicineDeets(id: '2', name: 'Zestril', description: 'https://www.webmd.com/drugs/2/drug-7101/zestril-oral/details', imageUrl: 'https://www.westend61.de/images/0000056568pw/white-pill-close-up-THF00831.jpg'),
    MedicineDeets(id: '3', name: 'Tenormin 100 mg Tablets', description: 'https://www.medicines.org.uk/emc/product/12854/smpc', imageUrl: 'https://www.westend61.de/images/0000056568pw/white-pill-close-up-THF00831.jpg'),
    MedicineDeets(id: '4', name: 'Effox', description: '1 pill', imageUrl: 'https://images.app.goo.gl/V47SZ5kqiFpTLZMV8'),
    MedicineDeets(id: '5', name: 'Panadol', description: '1 pill', imageUrl: 'https://www.westend61.de/images/0000056568pw/white-pill-close-up-THF00831.jpg'),
  ];

  addMedInList(String id, String name, String description, String img) {
    final newMed = MedicineDeets(
      id: id,
      name: name,
      description: description,
      imageUrl: img,
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
      description: "400",
      imageUrl: "12/4",
    );
    medslist.add(newMed);
    notifyListeners();
  }

  editTiming(time) {
    time = time;
    notifyListeners();
  }
}
