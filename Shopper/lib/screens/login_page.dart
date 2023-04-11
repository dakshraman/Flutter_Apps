import 'package:flutter/material.dart';
import 'package:shopper/screens/my_button.dart';
import 'package:shopper/screens/mytextfield.dart';
import 'package:shopper/screens/square_tile.dart';

class login_page extends StatelessWidget {
  login_page({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Icon(
              Icons.shopping_bag, size: 100,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 20,),
            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.grey.shade50,
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 25,),
            mytextfield(
              controller: usernameController,
              hintText: "username",
              obscureText: false,
            ),
            const SizedBox(height: 10,),
            mytextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Forgot Password",
                    style: TextStyle(color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            mybutton(
                onTap: signUserIn,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 5,
                      color: Colors.grey[500],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                    thickness: 5,
                      color: Colors.grey[500],
                  ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: "images/google.png"),
                const SizedBox(width: 25,),
                SquareTile(imagePath: "images/apple-logo.png"),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                    'Register Now',
                  style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}