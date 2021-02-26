import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './index.dart';
import './loading.dart';

class Restaurants extends StatefulWidget {
  Restaurants({Key key}) : super(key: key);

  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {

  @override
  Widget build(BuildContext context) {
    void _onTap(int index) {
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FFTHome()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Restaurants()),
        );
      }
    }


    return Scaffold(
      body: Loading(),
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
        onTap: _onTap,
      )
    );
  }
}
