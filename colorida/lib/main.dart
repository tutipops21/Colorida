import 'dart:math' as Math;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cambio de Color',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 37, 72, 101),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ColorWidget(),
              ),
              Expanded(
                flex: 3,
                child: ColorWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorWidget extends StatefulWidget {
  @override
  _ColorWidgetState createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _changeColor();
            });
          },
          child: Text(
            'Cambiar',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 196, 186, 57)),
          ),
        ),
      ),
    );
  }

  void _changeColor() {
    setState(() {
      _backgroundColor = _randomColor();
    });
  }

  Color _randomColor() {
    return Color((Math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
