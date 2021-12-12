class MedicineDeets {
  final String id;
  final String name;
  final String dose;
  final String time;

  MedicineDeets({
    required this.id,
    required this.name,
    required this.dose,
    required this.time,
  });

  String get getName => name;
  String get getDose => dose;
  String get getTime => time;
}
