import 'package:ARhomes/screens/homeView.dart';
import 'package:ARhomes/screens/itemListScreen.dart';
import 'package:ARhomes/screens/rounded_button.dart';
import 'package:ARhomes/screens/rounded_input_field.dart';
import 'package:ARhomes/screens/rounded_password_field.dart';
import 'package:ARhomes/screens/showSnackBar.dart';
import 'package:ARhomes/screens/signUpScreen.dart';
import 'package:ARhomes/screens/welcomeBackground.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool login = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    color: Colors.white),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/tech.png",
                height: size.height * 0.15,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedInputField(
                icon: Icons.email,
                hintText: "Email ID",
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  try {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((UserCredential user) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                    });
                  } on FirebaseAuthException catch (e) {
                    showSnakBar(context, e.message);
                  }
                },
                color: Colors.blueGrey,
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    login
                        ? "Don’t have an Account ? "
                        : "Already have an Account ? ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      login ? "Sign Up" : "Sign In",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
