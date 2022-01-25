import 'package:flutter/material.dart';
import 'package:health_care_app/Models/user.dart';

class UsersProvider extends ChangeNotifier {
  List<User> usersList = [
    User(
        name: 'Ahmed',
        mail: 'ahmed@gmail.com',
        DOB: '2-2-2020',
        phone: '01002002300',
        password: '123'),
    User(
        name: 'Salma',
        mail: 'salma@gmail.com',
        DOB: '2-2-2020',
        phone: '01002202304',
        password: '1234'),
    User(
        name: 'Youssef',
        mail: 'youssef@gmail.com',
        DOB: '2-2-2020',
        phone: '01202002383',
        password: 'youssef123'),
    User(
        name: 'Merna',
        mail: 'merna1234@gmail.com',
        DOB: '2-2-2020',
        phone: '01198203297',
        password: 'maram24'),
  ];

  addUser(String name, String mail, String DOB, String phone, String password) {
    final newUser = User(
      name: name,
      mail: mail,
      DOB: DOB,
      phone: phone,
      // gender: gender,
      // username: username,
      password: password,
    );
    usersList.add(newUser);
    notifyListeners();
  }

  List<User> get users => [...usersList];

  // void deleteMed(username) {
  //   usersList.removeWhere((user) => user.username == username);
  //   notifyListeners();
  // }
}
