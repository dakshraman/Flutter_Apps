import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:whatsapp/homepage.dart';
import 'package:whatsapp/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      title: "Whatsapp",
      //theme:
      //darkTheme ThemeClass.darkTheme,
      //themeMode ThemeMode.system,
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        middle: Text(
          'Whatsapp',
          style: TextStyle(
              fontSize: 25,
              color: Colors.black
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/welcome.png',
              height: 300,
              width: 300,
              color: Colors.blue,
            ),
            SizedBox(height: 30),
            const Text(
              'Welcome to WhatsApp',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 25),
            const Text(
              "Privacy and Terms",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),
            ),
            SizedBox(height: 25),
            CupertinoButton.filled(
              child: Text(
                'Agree and continue',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}