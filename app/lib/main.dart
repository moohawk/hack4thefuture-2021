import 'package:flutter/material.dart';
import './screens/index.dart';

void main() {
  runApp(FFTApp());
}

class FFTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FFTHome(),
    );
  }
}
