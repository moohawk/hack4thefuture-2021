import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import './index.dart';
import './loading.dart';
import '../theme.dart';


class MapScreen extends StatefulWidget {
  MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  BitmapDescriptor _markerIcon;

  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controllerInstance;
  Map<MarkerId, Marker> restaurants = <MarkerId, Marker>{};
  LatLng _initialCoordinates;

  void _atUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best
    );

    setState(() {
        _initialCoordinates = new LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    _atUserLocation();
  }


  void _searchRestaurants(LatLngBounds bounds) async {
    try {
      Response response = await Dio(BaseOptions(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
      )).post(
        "http://localhost:8000/restaurants/search",
        data: {
          "sw": {
            "latitude": bounds.southwest.latitude,
            "longitude": bounds.southwest.longitude,
          },
          "ne": {
            "latitude": bounds.northeast.latitude,
            "longitude": bounds.northeast.longitude,
          },
          "limit": 30,
        }
      );

      setState(() {
          print(response.data);
          (response.data as List<dynamic>).map((r) {
              print(r);
              final MarkerId mid = MarkerId(r['id']);
              restaurants[mid] = Marker(
                markerId: mid,
                position: LatLng(r['lat'], r['lon']),
                icon: _markerIcon,
              );
          }).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  initAssets(context) {
    if (_markerIcon == null) {
      ImageConfiguration config = createLocalImageConfiguration(context, size: Size.square(12));
      BitmapDescriptor.fromAssetImage(config, 'assets/marker-restaurant-128.png')
      .then((icon) {
          setState(() {
              _markerIcon = icon;
          });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initAssets(context);

    return Scaffold(
      body: _initialCoordinates == null ? Loading() : GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _controllerInstance = controller;
        },
        onCameraIdle: () {
          if (_controller.isCompleted) {
            _controllerInstance.getVisibleRegion().then(
              (bounds) {
                _searchRestaurants(bounds);
            });
          }
        },
        initialCameraPosition: CameraPosition(
          target: _initialCoordinates,
          zoom: 17.0
        ),
        markers: Set<Marker>.of(restaurants.values),
      ),
    );
  }
}
