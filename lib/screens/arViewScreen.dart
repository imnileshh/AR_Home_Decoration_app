import 'package:ARhomes/screens/showSnackBar.dart';
import 'package:ARhomes/screens/welcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARViewScreen extends StatefulWidget {
  String itemImg;
  ARViewScreen({Key? key, required this.itemImg}) : super(key: key);

  @override
  _ARViewScreenState createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  late ArCoreController arCoreController;

  void whenARCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = controlOnPlaneTap;
  }

  void controlOnPlaneTap(List<ArCoreHitTestResult> results) {
    final hit = results.first;
    addItemImagetoScene(hit);
  }

  Future addItemImagetoScene(ArCoreHitTestResult hitTestResult) async {
    final bytes = (await rootBundle.load(widget.itemImg)).buffer.asUint8List();
    final imageItem = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 600, height: 600),
      position: hitTestResult.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation:
          hitTestResult.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );
    arCoreController.addArCoreNodeWithAnchor(imageItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ARhomes",
          style: TextStyle(
            fontFamily: 'Pony',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF142323),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                }).catchError((e) {
                  showSnakBar(context, e.message);
                });
              },
              icon: const Icon(Icons.login_rounded))
        ],
      ),
      body: ArCoreView(
        onArCoreViewCreated: whenARCoreViewCreated,
        enableTapRecognizer: true,
        enableUpdateListener: true,
      ),
    );
  }
}
