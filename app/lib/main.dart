import 'package:flutter/material.dart';
import './screens/index.dart';
import 'layout.dart';
import 'theme.dart';

void main() {
  runApp(FFTApp());
}

class FFTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Layout(),
    );
  }
}
