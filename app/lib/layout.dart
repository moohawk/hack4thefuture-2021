import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'theme.dart';

import './screens/feed.dart';
import './screens/map.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with TickerProviderStateMixin {
  AnimationController animationController;
  int _selectedScreen = 0;

  final List<Widget> _appScreens = [
    Feed(),
    MapScreen(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appBar(),
            Expanded(
              child: _appScreens[_selectedScreen],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.rss_mco),
            label: 'Начало',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.map_marker_radius_mco),
            label: 'Около мен',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.timeline_text_mco),
            label: 'История',
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.food_mco),
            label: 'Храна',
          ),
        ],
        currentIndex: _selectedScreen,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: AppTheme.black,
        onTap: (index)  {
          setState(() {
              _selectedScreen = index;
          });
        },
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Food4Thought',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.view_agenda,
                    color: AppTheme.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
