import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Models/medicine_details.dart';
import 'package:health_care_app/Providers/meds.dart';
import 'package:health_care_app/services/authentication_helper.dart';
import 'package:provider/provider.dart';
import 'one_med.dart';
import 'package:provider/provider.dart' as provider;

class MedicinesWidget extends StatefulWidget {
  MedicinesWidget({Key? key}) : super(key: key);

  @override
  _MedicinesWidgetState createState() => _MedicinesWidgetState();
}

class _MedicinesWidgetState extends State<MedicinesWidget> {
  List<Object> _medicationList=[];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getUserMeds2();

  }

  @override
  Widget build(BuildContext context) {
   final medData = provider.Provider.of<Meds>(context);
    final medications = medData.medicationList;

    // final meds=provider.Provider.of<QuerySnapshot>(context);
     //print(meds);
    
    return Padding(
      padding: const EdgeInsets.all(30.0),
      
        child: Container(
          width: 250,
          child: ListView.builder(
            itemCount: _medicationList.length,
            itemBuilder: (ctx, i) {
              print('$i');
            //   return Text('$i');
              
            // }
            return OneMed(
              _medicationList[i] as MedicineDeets,
             i,
            );
            }
          ),
       // )
      ));
            }
  

  Future getUserMeds2() async{
  final uid=AuthService().currentUser?.uid;
  var data = await FirebaseFirestore.instance
    .collection('userMeds')
    .doc(uid)
    .collection('meds')
    .get();

    setState(() {
      _medicationList=List.from(data.docs.map((doc)=> MedicineDeets.fromJson(doc)));

    });

    

}

}
class MedicinesWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final medData = provider.Provider.of<Meds>(context);
    final medications = medData.medicationList;
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Container(
          width: 250,
          child: ListView.builder(
            itemCount: medications.length,
            itemBuilder: (ctx, i) => OneMed(
              medications[i],
              i,
            ),
          ),
        ),
      ),
    );
  }
}
