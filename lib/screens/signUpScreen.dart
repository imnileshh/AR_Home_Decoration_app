import 'package:ARhomes/screens/loginScreen.dart';
import 'package:ARhomes/screens/rounded_input_field.dart';
import 'package:ARhomes/screens/rounded_password_field.dart';
import 'package:ARhomes/screens/showSnackBar.dart';
import 'package:ARhomes/screens/welcomeBackground.dart';
import 'package:ARhomes/services/usermanagment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String firstName = "";
  late String lastName = "";
  late String email = "";
  late String password = "";
  late num phoneNumber;
  late String displayName = "";
  bool login = false;
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
                "SIGNUP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                    color: Colors.white70),
              ),
              // SizedBox(height: size.height * 0.01),
              // SvgPicture.asset(
              //   "assets/icons/signup.svg",
              //   height: size.height * 0.15,
              // ),
              SizedBox(height: size.height * 0.01),
              RoundedInputField(
                hintText: "First Name",
                onChanged: (value) {
                  setState(() {
                    firstName = value;
                  });
                },
              ),
              RoundedInputField(
                icon: Icons.person,
                hintText: "LastName",
                onChanged: (value) {
                  setState(() {
                    lastName = value;
                    // displayName = firstName + " " + lastName;
                  });
                },
              ),
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
              RoundedInputField(
                icon: Icons.phone,
                hintText: "Phone Number",
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value as num;
                  });
                },
              ),
              // RoundedInputField(
              //   icon: Icons.people,
              //   hintText: "Team Id",
              //   onChanged: (value) {},
              // ),
              // RoundedButton(
              //   text: "SIGNUP",
              //   press: () {
              //     try {
              //       FirebaseAuth.instance
              //           .createUserWithEmailAndPassword(
              //               email: email, password: password)
              //           .then((signedInUser) {
              //         User? firebaseUser = signedInUser.user;
              //         firebaseUser
              //             ?.updateDisplayName(firstName + ' ' + lastName);
              //         // firebaseUser?.updatePhoneNumber(phoneNumber);
              //         UserManagment().storeNewUser(signedInUser, context);
              //       });
              //     } on FirebaseAuthException catch (e) {
              //       showSnakBar(context, e.message);
              //     }
              //   },
              // ),
              
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                color: Colors.blueGrey,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password)
                            .then((signedInUser) {
                          User? firebaseUser = signedInUser.user;
                          firebaseUser
                              ?.updateDisplayName(firstName + ' ' + lastName);
                          // firebaseUser?.updatePhoneNumber(phoneNumber);
                          UserManagment().storeNewUser(signedInUser, context);
                        });
                      } on FirebaseAuthException catch (e) {
                        showSnakBar(context, e.message);
                      }
                    },
                    child: Text(
                      "SignUP",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blueGrey)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  login
                      ? "Don't have an Account ? "
                      : "Already have an Account ? ",
                  style: TextStyle(color: Colors.white60),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    login ? "Sign Up" : "Sign In",
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 10),
              //   width: size.width * 0.8,
              //   color: kPrimaryColor,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(29),
              //     child: ElevatedButton(
              //       onPressed: () async {
              //         try {
              //           FirebaseAuth.instance
              //               .createUserWithEmailAndPassword(
              //                   email: email, password: password)
              //               .then((signedInUser) {
              //             User? firebaseUser = signedInUser.user;
              //             firebaseUser
              //                 ?.updateDisplayName(firstName + ' ' + lastName);
              //             // firebaseUser?.updatePhoneNumber(phoneNumber);
              //             UserManagment().storeNewUser(signedInUser, context);
              //           });
              //         } on FirebaseAuthException catch (e) {
              //           showSnakBar(context, e.message);
              //         }
              //       },
              //       child: Text(
              //         "SignUP",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
