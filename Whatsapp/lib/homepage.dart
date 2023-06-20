import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/Settings.dart';
import 'package:whatsapp/callspage.dart';
import 'package:whatsapp/community.dart';
import 'package:whatsapp/statuspage.dart';
import 'package:whatsapp/chatpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(Homepage()));
  runApp(const Homepage());
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      home: CupertinoTabScaffold(
        controller: CupertinoTabController(

        ),
        backgroundColor: Colors.white,
        tabBar: CupertinoTabBar(
          height: 55,
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle),
              activeIcon: Icon(CupertinoIcons.largecircle_fill_circle),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.phone),
              activeIcon: Icon(CupertinoIcons.phone_fill),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_3),
              activeIcon: Icon(CupertinoIcons.person_3_fill),
              label: 'Communities',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid),
              //activeIcon: Icon(CupertinoIcons.gear_alt_fill),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              switch (index) {
                case 0:
                  return StatusPage();
                case 1:
                  return CallsPage();
                case 2:
                  return CommunityPage();
                case 3:
                  return ChatPage();
                case 4:
                  return SettingsPage();
                default:
                  return Container();
              }
            },
          );
        },
      ),
    );
  }
}