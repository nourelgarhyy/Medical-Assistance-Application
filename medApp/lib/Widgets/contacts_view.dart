import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Models/contact_details.dart';
import 'package:health_care_app/Providers/contacts.dart';
import 'package:provider/provider.dart' as provider;
import 'one_contact.dart';


class ContactsWidget extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
   // final contactsProvider =provider.Provider.of<AllContacts>(context);
   
   return Scaffold(
            body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('contacts')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (ctx, i) =>
                  Card(
           
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
            side: BorderSide(color: Colors.blueGrey, width: 0.5),
          ),
          child: ListTile(
            title: Text(
              streamSnapshot.data!.docs[i]['name'],
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              streamSnapshot.data!.docs[i]['phone'],
              textAlign: TextAlign.center,
            ),
            isThreeLine: true,
            // trailing: IconButton(
            //   onPressed:(){},
            //   //onPressed:()async{ contactsProvider.deleteContact();}, 
            //   icon: Icon(Icons.delete)
            //   )
          )
          
          ),
                                      
               
            );
            
          },
        )
       
       );

 
    
   }
  
}
// class OneContact extends StatelessWidget {
  
//  late ContactDeets contact;
//  // OneContact(this.contact);
//  OneContact(this.contact);

//   @override
//   Widget build(BuildContext context) {
    
//     return Container(
//       //width:MediaQuery.of(context).size.width * 0.50, height:70,

//       child: Card(
        
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40.0),
//             side: BorderSide(color: Colors.blueGrey, width: 0.5),
//           ),
//           child: ListTile(
//             title: Text(
//               contact.name,
//               textAlign: TextAlign.center,
//             ),
//             subtitle: Text(
//               "${contact.phone} ",
//               textAlign: TextAlign.center,
//             ),
//             isThreeLine: true,
//           )),
//     );
//   }
// }
