import "package:flutter/material.dart";

import 'package:getwidget/getwidget.dart';
import 'package:racket/AllWidgets/Divider.dart';
import 'package:racket/AllScreens/MainScreen.dart';
import 'package:racket/AllScreens/AboutScreen.dart';

class ContactUs extends StatelessWidget{
  static const String idScreen = "contact";

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
        title: Text('Contact Us'),
      ),
      body:SingleChildScrollView(

        child: Container(
            child: Column(
              children: <Widget>[

                Image.asset('images/VNITview.jpg'),

                GFAccordion(
                  title: "EMAIL ID:",textStyle: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.black54),
                  content: "\n vnitcontact@gmail.com  \n",
                  collapsedIcon: Icon(Icons.add_circle),
                  expandedIcon: Icon(Icons.arrow_circle_up_rounded),

                ),GFAccordion(
                  title: "PHONE NUMBER",
                  content: "\n 8769543231 \n", textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black54),
                  collapsedIcon: Icon(Icons.add_circle),
                  expandedIcon: Icon(Icons.arrow_circle_up_rounded),

                ),GFAccordion(
                  title: "ADDRESS",
                  content: "\n VNIT S.Ambazari Road, Nagpur \n",textStyle: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.black54),
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