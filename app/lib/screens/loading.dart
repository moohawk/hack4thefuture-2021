import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
