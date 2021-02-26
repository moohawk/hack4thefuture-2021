import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './index.dart';
import './loading.dart';

class Restaurants extends StatefulWidget {
  Restaurants({Key key}) : super(key: key);

  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {

  Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> restaurants = <MarkerId, Marker>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(42.7011, 23.3144),
    zoom: 14.4746,
  );

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
      body: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          setState(() {
              final mid = MarkerId('test');
              restaurants[mid] = Marker(
                markerId: mid,
                position: LatLng(42.7011, 23.3144),
              );
          });
        },
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(restaurants.values),
      ),
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
