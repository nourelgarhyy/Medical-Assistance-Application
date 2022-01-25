


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/Models/medicine_details.dart';
import 'package:health_care_app/Models/user.dart';
import 'package:health_care_app/Providers/meds.dart';
import 'package:health_care_app/services/authentication_helper.dart';
import 'package:provider/provider.dart' as provider;

  

  Future addMed({required String med2, required String dose,required String time}) async{
  final uid=AuthService().currentUser?.uid;
  final Med=FirebaseFirestore.instance.collection('userMeds').doc(uid).collection('meds').doc();

  
  final med=MedicineDeets(
  id: Med.id,
  med: med2,
  dose: dose,
  time: time,
    
  );
  final json=med.toJson();
  await  Med.set(json);

}

class DatabaseService{
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userMedsCollection = FirebaseFirestore.instance.collection('userMeds');

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('userMeds')
.doc(AuthService().currentUser?.uid)
.collection('meds').snapshots();

Future updateUserData(String med, String dose, String time) async{
  return await userMedsCollection.doc(uid).collection("meds").doc().set({
    'med':med,
    'dose':dose,
    'time':time,
  });
 


}
Future updateUserData2([String name="new", String time="new", String location="new"]) async{
  return await userMedsCollection.doc(uid).collection("appointments").doc().set({
    'name':name,
    'location':location,
    'time':time,
  });
 

}
// Future createUser(User user) async {
//   final docUser = FirebaseFirestore.instance.collection('users').doc(data.uid);
//   user.id = docUser.id;
//   final json = user.toJson();
//   await docUser.set(json);
// }



// List<MedicineDeets> _medListFromSnapshot(QuerySnapshot snapshot){
//   return snapshot.documents.map((doc){
//     return MedcineDeets(
//       id:doc.data['id'] ?? '',
//       name:doc.get('name')?? '',
//       name:doc.get('dose') ?? '',
//       name:doc.get('time') ?? '',
//     );
//   }).toList(); 
// }
// Stream<QuerySnapshot> get userMeds{
//   return userMedsCollection.snapshots();
// }

}


  


