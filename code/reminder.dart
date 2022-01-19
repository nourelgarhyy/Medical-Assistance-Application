import 'dart:math';

class Reminder {
  Random id;
  String name;
  String dose;
  String time;
  String description;

  Reminder(
    this.id, {
    required this.name,
    required this.dose,
    required this.time,
    required this.description,
  });
}
