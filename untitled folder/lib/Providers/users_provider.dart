import 'package:flutter/material.dart';
import 'package:health_care_app/Models/user.dart';
class UsersProvider extends ChangeNotifier {
  List<User> usersList = [
    User(name:'Ahmed', mail:'ahmed@gmail.com', phone:'01002002300',gender:'male', username:'ahmedd', password:'123'),
    User(name:'Salma', mail:'salma@gmail.com', phone:'01002202304',gender:'female', username:'salma123', password:'1234'),
    User(name:'Youssef', mail:'youssef@gmail.com', phone:'01202002383',gender:'male', username:'youssef135', password:'youssef123'),
    User(name:'Merna', mail:'merna1234@gmail.com', phone:'01198203297',gender:'female', username:'maram_', password:'maram24'),

    
  ];

  addUser(String name, String mail, String phone, String gender, String username, String password) {
    final newUser = User(
      name: name,
      mail: mail,
      phone: phone,
      gender: gender,
      username: username,
      password: password,
    );
    usersList.add(newUser);
    notifyListeners();
  }

  List<User> get users => [...usersList];

  void deleteMed(username) {
    usersList.removeWhere((user) => user.username == username);
    notifyListeners();
  }

 
}
