import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:google_nav_bar/google_nav_bar.dart';
class HomeAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Shopper",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Spacer(),
          badges.Badge(
            onTap: () {},
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.blue,
            ),
            badgeContent: Text(""),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, "loginpage");
              },
              child: Icon(Icons.account_circle_outlined),
            ),
          )
        ],
      ),
    );
  }
}