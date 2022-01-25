class MedicineDeets {
  final String id;
  final String med;
  final String dose;
  final String time;

  MedicineDeets({
    required this.id,
    required this.med,
    required this.dose,
    required this.time,
  });
  String get getID => id;
  String get getName => med;
  String get getDose => dose;
  String get getTime => time;
  
  Map<String, dynamic> toJson()=>{
  'id':id,
  'name': med, 
  'dose': dose,
  'time': time,

};

 MedicineDeets.fromJson(json):

  id= json.data()['id']??"",
  med=json.data()['name']?? "whateves",
  dose=json.data()['dose'],
  time =json.data()['time'];




}

