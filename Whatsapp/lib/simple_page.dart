import 'package:flutter/cupertino.dart';

class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}