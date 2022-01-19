class User {
  String name;
  String mail;
  String phone;
  String gender;
  String username;
  String password;

  User({
    required this.name, 
    required this.mail, 
    required this.phone, 
    required this.gender,
    required this.username,
    required this.password
    });
      
  String get getName => name;
  String get getMail => mail;
  String get getGender => gender;
  String get getPhone => phone;
  String get getUsername => username;
  String get getPassword => password;
  

}
