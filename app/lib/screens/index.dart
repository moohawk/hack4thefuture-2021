import 'package:fft/offer/offer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'restaurants.dart';

class FFTHome extends StatefulWidget {
  FFTHome({Key key}) : super(key: key);
  @override
  _FFTHomeState createState() => _FFTHomeState();
}


class _FFTHomeState extends State<FFTHome> {

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
      body: OfferHomeScreen(),
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
