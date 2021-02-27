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
      //////////////////////////////////////////////////////
      // Response response = await Dio(BaseOptions(       //
      //     contentType: Headers.jsonContentType,        //
      //     responseType: ResponseType.json,             //
      // )).get(                                          //
      //   "http://localhost:8000/restaurants/search"     //
      // );                                               //
      //                                                  //
      // setState(() {                                    //
      //     print(response.data);                        //
      //     _feedItems = response.data as List<dynamic>; //
      // });                                              //
      //////////////////////////////////////////////////////
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
        margin: new EdgeInsets.only(left: 8.0, top: 25.0, right: 8.0, bottom: 0),
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
              Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 12 - 8.0 * 0.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 0, right: 8.0, bottom: 0),
                            child: Text(
                              'Последни предложения',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22 + 6 - 6 * 0.8,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
