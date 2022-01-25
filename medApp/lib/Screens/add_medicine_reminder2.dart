// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:health_care_app/services/authentication_helper.dart';
import 'package:health_care_app/Models/reminder.dart';
import 'package:intl/intl.dart';

class AddMedicine extends StatefulWidget {
  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final _formKey = GlobalKey<FormState>();
  get nav => Navigation();
  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  //TextEditingController timeController =
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Medicine Reminder'),

        elevation: 0.0,
        backgroundColor: Color(0xff053F5E),

        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.white,
        // ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.white,
              ),
            ),
          ),
          // GestureDetector(
          //   child: Container(
          //     margin: EdgeInsets.only(right: 5),
          //     child: Image.asset("assets/profile_img.png"),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: nav,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 60,
                 // width: ,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.medication), hintText: "Medicine "),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(15),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: timeController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.timer), hintText: "Dose Time"),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );
          
                        if (pickedTime != null) {
                          print(pickedTime.format(context));
                          DateTime parsedTime = DateFormat.jm()
                              .parse(pickedTime.format(context).toString());
                          print(parsedTime);
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime);
          
                          setState(() {
                            timeController.text = formattedTime;
                          });
                        } else {
                          print("Time is not selected");
                        }
                      },
                    ))),
                Container(
                    padding: EdgeInsets.all(15),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: startDateController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), hintText: "From"),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
          
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
          
                          setState(() {
                            startDateController.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ))),
                Container(
                    padding: EdgeInsets.all(15),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: endDateController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), hintText: "Until"),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
          
                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);
          
                          setState(() {
                            endDateController.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ))),
                MaterialButton(
                    color: Color(0xff107163),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    onPressed: () {
                      String name = nameController.text;
                      String time = timeController.text;
                      String startDate = startDateController.text;
                      String endDate = endDateController.text;
                      // createReminder(
                      //     name: name,
                      //     time: time,
                      //     startDate: startDate,
                      //     endDate: endDate);
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
