import "package:flutter/material.dart";

import 'package:getwidget/getwidget.dart';
import 'package:racket/AllWidgets/Divider.dart';
import 'package:racket/AllScreens/MainScreen.dart';
import 'package:racket/AllScreens/AboutScreen.dart';

class ContactScreen extends StatelessWidget{
  static const String idScreen = "contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,

      appBar: AppBar(title: Text('Contact Us'),),
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
                leading: Icon(Icons.wysiwyg),
                title: Text("About"),
                onTap: ()
                {
                  Navigator.pushNamedAndRemoveUntil(context, AboutScreen.idScreen, (route) => false);
                },
              ),
              ListTile(
                leading: Icon(Icons.wysiwyg),
                title: Text("Contact Us"),
                onTap: ()
                {
                  Navigator.pushNamedAndRemoveUntil(context, ContactScreen.idScreen, (route) => false);
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
                  title: "EMAIL ID:",textStyle: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.black54),
                  content: "\n vnitcontact@gmail.com \n",
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
