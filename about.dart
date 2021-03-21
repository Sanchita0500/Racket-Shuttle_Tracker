import "package:flutter/material.dart";

import 'package:getwidget/getwidget.dart';
void main()
{
  runApp(
    MaterialApp(
      home: aboutus()
    )
  );
}

class aboutus extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ABOUT PAGE'),),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset('assets/images/VNIT_Nagpur_main.jpg'),
            GFAccordion(
              title: "ABOUT APP",
              content: "VNIT recently introduced a shuttle service on campus which made conveyance extremely convenient. The shuttles follow pre-defined routes around the campus, but the timing of their arrival and departure from a stop is generally unknown.Our project, Racket-Shuttle Tracker, aims to work around these issues as well as make it all-the-more comfortable for the people on campus to use.",
            ),GFAccordion(
              title: "ABOUT US",
              content: "VNIT",
            ),GFAccordion(
              title: "CONTACT US",
              content: "Email id: xxyz@gmail.com "
                  "     Phone Number: 8769543231"
              "         Address : VNIT S.Ambazari Road, Nagpur",
            )
          ],
        )
      ),
    );
  }
}