import 'package:ARhomes/screens/custome_onboarding_model.dart';
import 'package:ARhomes/screens/itemListScreen.dart';
import 'package:ARhomes/screens/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = "onboarding screen";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Widget> getPages() {
    return [
      const CustomOnboardingPageViewModel(
        imageUrl: 'assets/images/onboarding-image-1.png',
        modelTitle: 'AR Decor Placement',
        modelDescription:
            "Use AR technology to place virtual decor elements in real-world spaces, allowing users to visualize how they would look in their homes.",
      ),
      const CustomOnboardingPageViewModel(
        imageUrl: 'assets/images/onboarding-image-2.png',
        modelTitle: 'Decor Catalogue',
        modelDescription:
            "Access a diverse catalog of decor items, furnishings, and accessories to offer a broad range of choices for visualization.",
      ),
      const CustomOnboardingPageViewModel(
        imageUrl: 'assets/images/onboarding-image-3.png',
        modelTitle: 'Furniture Customization',
        modelDescription:
            'Customize your furniture to fit your unique style and preferences. Choose from a wide range of materials, colors, and designs to create the perfect piece for your home.',
      ),
      // const CustomOnboardingPageViewModel(
      //   imageUrl: 'assets/images/onboarding-image-3.png',
      //   modelTitle: 'Engage with Gamification',
      //   modelDescription:
      //       'Experience a new dimension of engagement through gamification. Earn rewards, badges, and recognition as you actively participate in the Azume community.',
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          rawPages: getPages(),
          onDone: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          )),
          done: const Text(
            'Get Started',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          next: FaIcon(
            FontAwesomeIcons.arrowRight,
            size: 18,
            color: Colors.white,
          ),
          globalBackgroundColor: const Color(0xff7F7F7F),
          dotsDecorator: const DotsDecorator(
            activeColor: Colors.white,
          ),
        ),
      ),
    );
  }
}