import 'package:flutter/material.dart';

class Destinations extends StatelessWidget {

  static const String idScreen = "Destinations";

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['Administrative Building','Architecture','Auditorium','Boys Hostel','Canteen','Chemical','Chemistry', 'Classroom Complex',
      'Computer Science','Electronics','Electrical','Girls Hostel','Health Centre','Mathematics','Metallurgy','Mechanical','Physics','Sports Ground','Workshops'];

    ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
