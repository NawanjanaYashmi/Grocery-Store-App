import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerystoreapp/widgets/BottomCartSheet.dart';
import 'package:grocerystoreapp/widgets/ItemsWidget.dart';
import 'package:grocerystoreapp/widgets/PopularItemsWidget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../widgets/CategoriesWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 136, 93),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom App Bar
              Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 243, 136, 93),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 2,
                            ),
                          ]),
                      child: Badge(
                        badgeColor: Colors.red,
                        padding: EdgeInsets.all(7),
                        badgeContent: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            showSlidingBottomSheet(
                              context,
                              builder: (context) {
                                return SlidingSheetDialog(
                                    elevation: 8,
                                    cornerRadius: 16,
                                    builder: (context, state) {
                                      return BottomCartSheet();
                                    });
                              },
                            );
                          },
                          child: Icon(
                            CupertinoIcons.cart,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Welcome Text
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "What do you want to Buy?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),

              //Search Widget
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search here...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),

              //Products Widgets
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                    PopularItemsWidget(),
                    ItemsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
