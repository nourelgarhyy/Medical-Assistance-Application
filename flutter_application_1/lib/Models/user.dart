class User {
  String id;
  String name;
  String mail;
  String phone;
  String DOB;
  String password;

  User({
    this.id = '',
    required this.name,
    required this.mail,
    required this.phone,
    required this.DOB,
    required this.password,
  });

  String get getName => name;
  String get getMail => mail;
  String get getPhone => phone;
  String get getPassword => password;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'mail': mail,
        'phone': phone,
        'DOB': DOB,
        'password': password,
      };
}
