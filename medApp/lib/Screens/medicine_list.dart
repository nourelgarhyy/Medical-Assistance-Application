import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Models/medicine_details.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Widgets/medicines_view.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:health_care_app/services/auth_status.dart';
import 'package:health_care_app/services/authentication_helper.dart';


class MedicineList extends StatefulWidget {
  MedicineList({Key? key}) : super(key: key);

  @override
  _MedicineList2State createState() => _MedicineList2State();
}

class _MedicineList2State extends State<MedicineList> {

  static const routeName = '/medicineList';
  final uid=AuthService().currentUser?.uid;
  
  get menuBar => MenuBar();
  get nav => Navigation();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('userMeds')
.doc(AuthService().currentUser?.uid)
.collection('meds').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine List"),
        backgroundColor: Color(0xff053F5E),
        centerTitle: true,
      ),
      bottomNavigationBar: nav, //Navigation Bar
      drawer: menuBar,
      body: 
    
      StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      if(snapshot.hasError){
          return Text("sth went wrong ${snapshot.data}");
         }
         else if(snapshot.hasData){
          final meds=snapshot.data!;
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
               title: Text("${data['name']} To be taken at ${data['time']}"),
                subtitle: Text("Start date: ${data['start_date']}  End date: ${data['start_date']} "),
            );
          }).toList(),
          );
        }
        else{
           return Center(child: CircularProgressIndicator());
         }
      } 
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAlertDialog(context);

          //Provider.of<Meds>(context, listen: false).addMedInList2();
        },
      ),
    );
}

Stream<List<MedicineDeets>> getUserMeds() =>FirebaseFirestore.instance
.collection('userMeds')
.snapshots()
.map((snapshot) => 
snapshot.docs.map((doc)=>MedicineDeets.fromJson(doc.data())).toList());

Stream<List<MedicineDeets>> getUserMeds3() {

  final uid=AuthService().currentUser?.uid;
  return FirebaseFirestore.instance
.collection('userMeds')
.doc(uid)
.collection('meds').snapshots()
.map((snapshot) => 
snapshot.docs.map((doc)=>MedicineDeets.fromJson(doc.data())).toList());
}

Widget  buildMeds( MedicineDeets med)=>ListTile(
                  title: Text(
                    med.med,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "${med.dose}, ${med.time} ",
                    textAlign: TextAlign.center,
                  ),
                  isThreeLine: true,
                 
                );



}
