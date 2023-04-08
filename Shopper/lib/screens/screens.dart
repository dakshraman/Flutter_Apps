import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Screens extends StatefulWidget {
  @override
  Widget (BuildContext context) {
    State<Screens> createState() => _ScreensState();
  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
  class _ScreensState extends State<Screens> {
    int _selectedIndex = 0;
    static List<Widget> _widgetOptions = <Widget>[
      Container(),
      Container(),
      Container(),
      Container(),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: GNav(
                    rippleColor: Colors.blueAccent,
                      hoverColor: Colors.red,
                      tabs: [
                        GButton(icon: LineIcons.home, text: 'Home'),
                        GButton(icon: LineIcons.shoppingBag, text: 'Cart'),
                        GButton(icon: LineIcons.heart, text: 'Wishlist'),
                        GButton(icon: LineIcons.user, text: 'Account'),
                      ],
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      }
                  ),
                  ),
              ),
            )
          );
    }
  }
