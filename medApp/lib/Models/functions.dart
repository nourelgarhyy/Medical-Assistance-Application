import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapMarks{

var markers=HashSet<Marker>(); //collection

marks(){
markers.add(
            Marker(markerId: MarkerId('1'), position: LatLng(30.11573981981459, 31.336087651187313) ),
            );
markers.add(
            Marker(markerId: MarkerId('2'), position: LatLng(30.122848186819112, 31.34337249141399) ),
            );
            return markers;
}
}