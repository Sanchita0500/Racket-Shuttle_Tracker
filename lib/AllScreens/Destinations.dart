import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainScreen.dart';

class Destinations extends StatelessWidget {
  static const String idScreen = "Destinations";

  @override
  Widget build(BuildContext context) {

    final List<String> entries = <String>['Administrative Building','Architecture','Auditorium','Boys Hostel','Canteen','Chemical','Chemistry', 'Classroom Complex',
        'Computer Science','Electronics','Electrical','Girls Hostel','Health Centre','Mathematics','Metallurgy','Mechanical','Physics','Sports Ground','Workshops'];

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
        title: Text('Tram Destinations'),),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children :<Widget> [
                  Flexible(
                    child: Card(
                      child: Column(
                        children: [
                          Text(' ${entries[index]}'),
                          SizedBox(width: 20.0,height: 15.0,)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
