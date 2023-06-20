import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_application/user.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      );
  }
}

class LoginPage extends StatelessWidget {
  TextEditingController _email= new TextEditingController();
  TextEditingController _password= new TextEditingController();
  Future<void> signup(BuildContext context) async{
    try {
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
    }catch(e){
      print(e);
    }
    print("Signin Successfull");
    Navigator.push(context, MaterialPageRoute(builder: (context) => user()));
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade200,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBlue.withOpacity(0.7),
        middle: Text(
          'Welcome',
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
              controller: _email,
              ),
              SizedBox(height: 25.0),
              CupertinoTextField(
                placeholder: 'Password',
                obscureText: true,
                controller: _password,
              ),
              SizedBox(height: 16.0),
              CupertinoButton.filled(
                child: Text('Login'),
                onPressed: () {
                  signup(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}