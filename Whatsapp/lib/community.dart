import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.black,
            largeTitle: const Text('Communities'),
          ),
          SliverFillRemaining(
            child: Column(
                children: [
                  Image.asset("images/communities.png"),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
