import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FFTHome extends StatefulWidget {
  FFTHome({Key key}) : super(key: key);
  @override
  _FFTHomeState createState() => _FFTHomeState();
}

class _FFTHomeState extends State<FFTHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.rss_mco),
            label: 'Начало',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.food_mco),
            label: 'Ресторанти',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      )
    );
  }
}
