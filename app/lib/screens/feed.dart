import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'loading.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool _loading = false;
  List<dynamic> _feedItems = List.empty();

  void _loadFeed() async {
    setState(() {
        _loading = true;
    });

    try {
      Response response = await Dio(BaseOptions(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
      )).get(
        "http://localhost:8000/restaurants/search"
      );

      setState(() {
          print(response.data);
          _feedItems = response.data as List<dynamic>;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
          _loading = false;
      });
    }
  }

  @override
  void initState() {
    _loadFeed();
    super.initState();
  }

  Widget main(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 150.0,
        margin: new EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(38.0),
          ),
        ),
        child: Card(
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album, size: 70),
                title: Text('Heart Shaker', style: TextStyle(color: Colors.white)),
                subtitle: Text('TWICE', style: TextStyle(color: Colors.white)),
              ),
            ]
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return _loading ? Loading() : main(context);
  }
}
