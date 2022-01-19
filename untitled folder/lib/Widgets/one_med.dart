import 'package:flutter/material.dart';
import 'package:health_care_app/Models/medicine_details.dart';
import 'package:health_care_app/Screens/view_single_medicine.dart';
import 'package:url_launcher/url_launcher.dart';

class OneMed extends StatelessWidget {
  MedicineDeets i;
  int index;
  OneMed(this.i, this.index);
  
 
  @override
  Widget build(BuildContext context) {
     String _url = i.description;
     void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
    return Column(
      children: [
          Image.network(
            i.imageUrl,
            fit: BoxFit.cover,
          ),
      
        Container(
            width: 350,
                
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, -0.5),
                          blurRadius: 10.0),
                    ]),
                    
          child: Card(
               // shape: const RoundedRectangleBorder(
                  //borderRadius: BorderRadius.only(
                      //bottomRight: Radius.circular(20),
                   //   topLeft: Radius.circular(20)),
                 // side: BorderSide(color: Colors.blueGrey, width: 0.5),
                //),
                //color: const Color(0xFF49BFC3).withOpacity(0.2),
                child: ListTile(
                  title: Text(
                    i.name,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "${i.description}, ${i.imageUrl} ",
                    textAlign: TextAlign.center,
                  ),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewMed(index: index),
                        ));
                  },
                ),
          
          ),
        ),
        ElevatedButton(onPressed: _launchURL, child: Text('deets'),),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}


