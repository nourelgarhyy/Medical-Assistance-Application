import 'package:flutter/material.dart';
import '../Models/reminder.dart';

class RemindersProvider extends ChangeNotifier {
  //Reminders List
  List<Reminder> _reminders = <Reminder>[];

  List<Reminder> get getReminders => _reminders;

  // function to add data to list of notes
  void addReminders(String name, String dose, String time, String description) {
    Reminder reminder = Reminder(name, dose, time, description);
    _reminders.add(reminder);
    notifyListeners();
  }

  // function to remove or delete notes by using list index position
  void removeReminders(int id) {
    _reminders.removeAt(id);
    notifyListeners();
  }
}
