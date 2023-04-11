import 'package:flutter/material.dart';
import 'package:shopper/screens/Homepage.dart';
import 'package:shopper/screens/CartPage.dart';
import 'package:shopper/screens/login_page.dart';
void main() =>
  runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/" : (context) => HomePage(),
        "cartPage" : (context) => CartPage(),
        "loginpage" : (context) => login_page(),
      },
    );
  }
}