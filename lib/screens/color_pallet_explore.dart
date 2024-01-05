import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPallet(),
    );
  }
}

class ColorPallet extends StatefulWidget {
  @override
  _ColorPalletState createState() => _ColorPalletState();
}

class _ColorPalletState extends State<ColorPallet> {
  Color wallColor = Colors.white; // Initial wall color

  void changeWallColor(Color newColor) {
    setState(() {
      wallColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Wall Color Change'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: wallColor,
              child: Center(
                child: Text(
                  'Tap to Change Wall Color',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ColorSelector(
              onSelectColor: changeWallColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ColorSelector extends StatelessWidget {
  final Function(Color) onSelectColor;

  ColorSelector({required this.onSelectColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ColorButton(
          color: Colors.red,
          onSelectColor: onSelectColor,
        ),
        ColorButton(
          color: Colors.blue,
          onSelectColor: onSelectColor,
        ),
        ColorButton(
          color: Colors.green,
          onSelectColor: onSelectColor,
        ),
      ],
    );
  }
}

class ColorButton extends StatelessWidget {
  final Color color;
  final Function(Color) onSelectColor;

  ColorButton({required this.color, required this.onSelectColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectColor(color);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
