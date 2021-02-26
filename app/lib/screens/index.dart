import 'package:fft/offer/offer_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'loading.dart';
import 'feed.dart';
import 'restaurants.dart';

class FFTHome extends StatefulWidget {
  FFTHome({Key key}) : super(key: key);

  @override
  _FFTHomeState createState() => _FFTHomeState();
}

class _FFTHomeState extends State<FFTHome> {

  int _currentWidget = 0;

  final List<Widget> _children = [
    Feed(),
    Restaurants(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentWidget],
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
        currentIndex: _currentWidget,
        selectedItemColor: Color(0xffff43a0),
        onTap: (index)  {
          setState(() {
              _currentWidget = index;
          });
        },
      )
    );
  }
}
