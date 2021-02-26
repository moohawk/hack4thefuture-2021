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
      body: Text("Details for ${_feedItems[0]['label']}"),
    );
  }

  Widget build(BuildContext context) {
    return _loading ? Loading() : main(context);
  }
}
