import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:racket/AllScreens/AboutScreen.dart';
import 'package:racket/AllScreens/LoginScreen.dart';
import 'package:racket/AllScreens/LoginDriverScreen.dart';
import 'package:racket/AllScreens/RegistrationScreen.dart';
import 'package:racket/AllScreens/SearchScreen.dart';
import 'package:racket/AllScreens/MainScreen.dart';
import 'package:racket/AllScreens/ProfileScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");
DatabaseReference driverRef = FirebaseDatabase.instance.reference().child("drivers");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Racket - Shuttle Tracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.idScreen,
      routes:
          {
            LoginScreen.idScreen: (context) => LoginScreen(),
            LoginDriverScreen.idScreen: (context) => LoginDriverScreen(),
            RegistrationScreen.idScreen: (context) => RegistrationScreen(),
            MainScreen.idScreen: (context) => MainScreen(),
            SearchScreen.idScreen: (context) => SearchScreen(),
            AboutScreen.idScreen: (context) => AboutScreen(),
            ProfileScreen.idScreen: (context) => ProfileScreen(),
          },
      debugShowCheckedModeBanner: false,
    );
  }
}