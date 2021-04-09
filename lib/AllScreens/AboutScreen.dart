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

      appBar: AppBar(title: Text('About Racket'),),
      drawer: Container(
        color: Colors.white,
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              //Drawer Header
              Container(
                height: 165.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 16.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Name", style: TextStyle(fontSize: 16.0),),
                          SizedBox(height: 6.0),
                          Text("View Profile"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DividerWidget(),
              SizedBox(height: 12.0),

              // Drawer Body
              ListTile(
                leading: Icon(Icons.wysiwyg),
                title: Text("Home"),
                onTap: ()
                {
                  Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
              ),
              ListTile(
                leading: Icon(Icons.wysiwyg),
                title: Text("About"),
                onTap: ()
                {
                  Navigator.pushNamedAndRemoveUntil(context, AboutScreen.idScreen, (route) => false);
                },
              ),
            ],
          ),
        ),
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

              ),GFAccordion(
                title: "CONTACT US",
                content: "Email id: xxyz@gmail.com \n \n Phone Number: 8769543231 \n \n Address : VNIT S.Ambazari Road, Nagpur",textStyle: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.black54),
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
