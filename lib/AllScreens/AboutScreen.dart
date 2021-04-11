import "package:flutter/material.dart";

import 'package:getwidget/getwidget.dart';
import 'package:racket/AllWidgets/Divider.dart';
import 'package:racket/AllScreens/MainScreen.dart';

class AboutScreen extends StatelessWidget{
  static const String idScreen = "about";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: ()
          {
            Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
          }
        ),
        title: Text('About Racket'),
      ),
      body:SingleChildScrollView(

          child: Container(
          child: Column(
            children: <Widget>[

              Image.asset('images/VNITview.jpg'),

              GFAccordion(
                title: "ABOUT APP",textStyle: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.black54),
                content: "\n VNIT recently introduced a shuttle service on campus which made conveyance extremely convenient."
                "The shuttles follow pre-defined routes around the campus, but the timing of their arrival and departure from a stop is generally unknown.\n\nOur project, Racket-Shuttle Tracker, aims to work around these issues as well as make it all-the-more comfortable for the people on campus to use.\n",
                collapsedIcon: Icon(Icons.add_circle),
                expandedIcon: Icon(Icons.arrow_circle_up_rounded),

              ),GFAccordion(
                title: "ABOUT US",
                content: "VNIT \n(need to be updated)", textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black54),
                collapsedIcon: Icon(Icons.add_circle),
                expandedIcon: Icon(Icons.arrow_circle_up_rounded),

              )
            ],
          )
        ),
      ),
    );
  }
}
