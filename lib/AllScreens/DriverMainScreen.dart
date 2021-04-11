import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverMainScreen extends StatefulWidget {

  static const String idScreen = "DriverMainScreen";

  @override
  _DriverMainScreenState createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.1232, 79.0515),
    zoom: 18.4746,
  );

  Set<Marker> _markers = {};

  void  _onMapCreated(GoogleMapController controller){
    setState((){
      // _markers.add(
      //   Marker(
      //       markerId: MarkerId('id-1'),
      //       position: LatLng(21.146633, 79.088860),
      //       infoWindow: InfoWindow(title: "Library"),),
      //       //icon: desticon.png,
      //       //Library
      // );
      _markers.add(
        Marker(
            markerId: MarkerId('id-2'),
            position: LatLng(21.125311, 79.052288),
            infoWindow: InfoWindow(title: "CSE"),),
            //icon: desticon.png,
            //CSE department
      );
      // _markers.add(
      //   Marker(
      //       markerId: MarkerId('id-3'),
      //       position: LatLng(21.125424, 79.050774),
      //       infoWindow: InfoWindow(title: "Classroom Complex"),),
      //       //icon: desticon.png
      //       //classroom complex
      // );
      _markers.add(
        Marker(
            markerId: MarkerId('id-4'),
            position: LatLng(21.128084, 79.056361),
            infoWindow: InfoWindow(title: "Girls Hostel"),)
            //icon: Image.asset("images/pickicon.png"),)
            //Girls hostel
      );
      _markers.add(
        Marker(
            markerId: MarkerId('id-5'),
            position: LatLng(21.125069, 79.046413),
            infoWindow: InfoWindow(title: "Boys Hostel"),)
            //icon: pickicon.png
            //Boys hostel block 3
      );
    });
  }
  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Driver Main Screen"),
    ),
    body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: _onMapCreated,
          markers: _markers,
        )
      ],
    ),
  );
  }
}