import 'package:ARhomes/screens/itemListScreen.dart';
import 'package:ARhomes/screens/loginScreen.dart';
import 'package:flutter/material.dart';

import 'welcomeBackground.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "WELCOME TO ARhomes !!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Image.asset(
              "assets/images/logo.png",
              width: 180,
            ),
            Text(
              "Design Your Dream Home in AR",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white60,
                fontFamily: 'Pony'
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
                    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Get Started ',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'cursive',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
                // Icon(Icons.keyboard_double_arrow_right_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}