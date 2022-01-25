import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_care_app/Models/functions.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';

class Map extends StatefulWidget {
  Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  MapMarks m=MapMarks();
  get nav => Navigation();
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      bottomNavigationBar: nav,
      body: GoogleMap(
        initialCameraPosition: 
      CameraPosition(target:LatLng(30.033333,31.233334), zoom:5, ),
      onMapCreated: (GoogleMapController googleMapController){
        setState(() {
          
        });
      },
      markers: m.marks(),
      ),
    );
  }
}