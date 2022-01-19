class MedicineDeets {
  final String id;
  final String name;
  final String imageUrl;
  final String description;

  MedicineDeets({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });
  String get getID => id;
  String get getName => name;
  String get getDose => imageUrl;
  String get getTime => description;
}
