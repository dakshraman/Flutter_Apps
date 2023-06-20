import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.number_circle_fill),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.camera),
            label: 'Camera',
          ),BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Text('Content of tab $index'),
            );
          },
        );
      },
    );
  }
}
      // child: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (BuildContext context, int index) {
      //     return CupertinoListTile(
      //       leading: CircleAvatar(),
      //       title: Text('User $index'),
      //       subtitle: Text('Message $index'),
      //       trailing: Text('12:34 PM'),
      //       onTap: () {
      //         // TODO: Handle chat item tap
      //       },
      //     );
      //   },
      // ),
