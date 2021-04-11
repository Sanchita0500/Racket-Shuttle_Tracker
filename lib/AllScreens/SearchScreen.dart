import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:racket/AllScreens/MainScreen.dart';
import 'package:racket/AllScreens/LoginScreen.dart';
import 'package:racket/AllWidgets/ProgressDialog.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import 'package:racket/AllWidgets/globals.dart' as globals;

import 'RegistrationScreen.dart';

class SearchScreen extends StatefulWidget {
  static const String idScreen = "search";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

DateTime now = DateTime.now();
String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

User user = FirebaseAuth.instance.currentUser;

class DropDownList extends StatefulWidget {

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {

  //String dropdownValue = '-';

  @override
  Widget build(BuildContext context) {
    return  DropdownButton<String>(
      isExpanded: true,
      value: globals.dropdownValue,
      underline: Container(),
      icon: Icon(Icons.arrow_downward),
      iconSize: 20.0, // can be changed, default: 24.0
      iconEnabledColor: Colors.black,
      onChanged: (String newValue) {
        setState(() {
          globals.dropdownValue = newValue;
        });

      },
      items: <String>['Administrative Building','Architecture','Auditorium','Boys Hostel','Canteen','Chemical','Chemistry', 'Classroom Complex',
        'Computer Science','Electronics','Electrical','Girls Hostel','Health Centre','Mathematics','Metallurgy','Mechanical','Physics','Sports Ground','Workshops', '-']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: ()
            {
              Navigator.pop(context);
            }
        ),
        title: Text('Set Drop Off'),),
      body:Column(
        children: [
          Container(
            height: 315.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.7,0.7),
                )
              ]
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 25.0,top:25.0,right:25.0,bottom: 20.0),
              child: Column(
                children:[
                  SizedBox(height: 5.0),
                  Row(
                      children: [
                        Image.asset("images/pickicon.png",height: 16.0,),

                        SizedBox(width: 18.0,),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child:Text("Pickup Location ",style: TextStyle(fontSize: 12.0),),

                            ),
                          ),
                        )
                      ]
                  ),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      SizedBox(width: 18.0,),
                      
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: DropDownList(),

                          ),
                        ),
                      )
                    ]
                  ),

                  SizedBox(height: 10.0),

                  Row(
                      children: [
                        Image.asset("images/desticon.png",height: 16.0,),

                        SizedBox(width: 18.0,),

                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child:Text("Where To? ",style: TextStyle(fontSize: 12.0),),

                            ),
                          ),
                        )
                      ]
                  ),

                  Row(
                      children: [
                        SizedBox(width: 18.0,),

                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: DropDownListWhere(),

                                )
                            )
                        )
                      ]
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    color: Colors.yellow,
                    textColor: Colors.white,
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Text(
                          "OK",
                          style: TextStyle(fontSize: 18.0, fontFamily: "Sansation", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0),
                    ),
                    onPressed: (){
                      SaveDataToDataBase(context);
                    },
                  )
                ]
              ),

            )
          ),
        ],
      )
    );
  }
}

void SaveDataToDataBase(BuildContext context) {

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return ProgressDialog(message: "Adding destination, please wait...",);
      }
  );

  if(user != null){

    Map userDataMap = {
      "from": globals.dropdownValue,
      "to": globals.dropdownValueWhere
    };

    userRef.child(formattedDate).set(userDataMap);
    displayToastMessage("Your destination added successfully", context);

    Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
  }
  else
  {
    Navigator.pop(context);
    displayToastMessage("Couldn't update destination", context);
  }

}

class DropDownListWhere extends StatefulWidget {

  @override
  _DropDownListStateWhere createState() => _DropDownListStateWhere();
}

class _DropDownListStateWhere extends State<DropDownListWhere> {

  //static String dropdownValueWhere = '-';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: globals.dropdownValueWhere,
      underline: Container(),
      icon: Icon(Icons.arrow_downward),
      iconSize: 20.0,
      // can be changed, default: 24.0
      iconEnabledColor: Colors.black,
      onChanged: (String newValue) {
        setState(() {
          globals.dropdownValueWhere = newValue;
        });
      },
      items: <String>[
        'Administrative Building',
        'Architecture',
        'Auditorium',
        'Boys Hostel',
        'Canteen',
        'Chemical',
        'Chemistry',
        'Classroom Complex',
        'Computer Science',
        'Electronics',
        'Electrical',
        'Girls Hostel',
        'Health Centre',
        'Mathematics',
        'Metallurgy',
        'Mechanical',
        'Physics',
        'Sports Ground',
        'Workshops','-'
      ]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


