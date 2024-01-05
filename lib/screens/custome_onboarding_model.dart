import 'package:flutter/material.dart';
// import 'package:mentorup_app/Screens/Domain/Business.dart';

class CustomOnboardingPageViewModel extends StatelessWidget {
  const CustomOnboardingPageViewModel({
    Key? key,
    required this.imageUrl,
    required this.modelTitle,
    required this.modelDescription,
  }) : super(key: key);

  final String imageUrl, modelTitle, modelDescription;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter:
              const ColorFilter.mode(Color(0xff7A7A7A), BlendMode.modulate),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              modelTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
            Text(
              modelDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}