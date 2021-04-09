import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:racket/AllWidgets/ProgressDialog.dart';
import 'package:racket/AllScreens/MainScreen.dart';
import 'package:racket/AllScreens/RegistrationScreen.dart';
import 'package:racket/main.dart';

class LoginScreen extends StatelessWidget {

  static const String idScreen = "loginScreen";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 35.0,),
              Image(
                image: AssetImage("images/logo.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              //image change karni hai
              SizedBox(height: 15.0,),
              Text(
                "Login",
                style: TextStyle(fontSize: 24.0, fontFamily: "Sansation", fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    SizedBox(height: 15.0,),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0
                          )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    SizedBox(height: 15.0,),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0
                          )
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),

                    SizedBox(height: 10.0,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                          onPrimary: Colors.white,
                          shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      )),
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18.0, fontFamily: "Sansation", fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onPressed: ()
                      {
                        if(!emailTextEditingController.text.contains("@"))
                        {
                          displayToastMessage("Invalid email address", context);
                        }
                        else if(passwordTextEditingController.text.isEmpty)
                        {
                          displayToastMessage("Password is mandatory", context);
                        }
                        else {
                          loginAndAuthenticateUser(context);
                        }
                      },
                    )

                  ],
                ),
              ),
              TextButton(
                onPressed: ()
                {
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationScreen.idScreen, (route) => false);
                },
                child: Text(
                  "Do not have an account? Click here ",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;*/
  void loginAndAuthenticateUser(BuildContext context) async
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return ProgressDialog(message: "Authenticating, please wait....",);
      }
    );
    /*
    final User firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text).
    catchError((errMsg)
    {
      Navigator.pop(context);   //to hide dialog box
      displayToastMessage("Error: " + errMsg.toString(), context);
    })).user;

    if(firebaseUser != null)
    {
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
        if(snap.value != null){
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
          displayToastMessage("You are now logged-in", context);
        }
        else
        {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("User doesn't exist, please create a new account", context);
        }
      });
    }*/
    if(true)
    {
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
      displayToastMessage("You are now logged-in", context);
    }
    else
    {
      Navigator.pop(context);
      displayToastMessage("Couldn't Sign in", context);
    }
  }
}
