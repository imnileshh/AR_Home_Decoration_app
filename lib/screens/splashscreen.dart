import 'package:ARhomes/screens/onBoarding.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ARhomes/screens/itemListScreen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:splashscreen/splashscreen.dart';
class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/bg.png', // Path to your background image
            fit: BoxFit.cover,
          ),
          // AnimatedSplashScreen
          AnimatedSplashScreen(
            duration: 500, // Duration of the splash animation
            splash: 'assets/images/logo.png', // Path to your splash logo
            nextScreen: OnboardingScreen(), // Your app's main screen
            splashTransition: SplashTransition.scaleTransition,
            animationDuration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.transparent, // Transparent background
            splashIconSize: 200, // Size of the splash logo
            centered: true,
          ),
        ],
      ),
    );
  }
}
