import 'package:flutter/material.dart';
import 'package:shopper/screens/HomeAppBar.dart';
import 'package:shopper/screens/CategoriesWidget.dart';
import 'package:shopper/screens/ItemsWidget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
           // height: 650,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(

                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Here....",
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                CategoriesWidget(),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ItemsWidget(),
              ],
            ),
          ),

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.home_filled, size: 30),
          Icon(Icons.shopping_cart_rounded, size: 30),
          Icon(Icons.list, size: 30),
        ],
        onTap: (index) {},
        height: 70,
        color: Colors.blueAccent,
      ),
    );
  }
}