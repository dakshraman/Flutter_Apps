import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int s=2;
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 2,),
                  Expanded(
                    child: CupertinoButton.filled(
                      onPressed: (){},
                      child: Text("1"),
                    ),
                  ),
                  SizedBox(width: 2,),
                  Expanded(
                    child: CupertinoButton.filled(
                      onPressed: (){},
                      child: Text("1"),
                    ),
                  ),
                  SizedBox(width: 2,),
                  Expanded(
                    child: CupertinoButton.filled(
                      onPressed: (){},
                      child: Text("1"),
                    ),
                  ),
                  SizedBox(width: 2,),
                  Expanded(
                    child: CupertinoButton.filled(
                      alignment: Alignment.center,
                      onPressed: (){},
                      child: Center(
                        child: Text("1",),
                      ),
                    ),
                  ),
                  SizedBox(width: 2,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}