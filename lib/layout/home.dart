import 'package:flutter/material.dart';
import 'package:news0/models/category.dart';
import 'package:news0/shared/network/remote/api_manger.dart';

import '../models/SourceResponce.dart';
import '../screens/categories_screen.dart';
import '../screens/drawaerwidget.dart';
import '../screens/tab_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home';

  // HomeScreen(CategoryDate categoryDate);
//

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          title: Text('News'),
        ),
        drawer: DrawaerWidget(onDrawaerSelected),
        body: categoryDate == null
            ? CategoriesScreen(oncategorySelected)
            : HomeScreen(), //categoryDate!
      ),
    );
  }

  CategoryDate? categoryDate = null;

  void onDrawaerSelected(number) {
    if (number == DrawaerWidget.CATEGORYIES) {
      categoryDate = null;
    } else if (number == DrawaerWidget.SETTINGS) {
      //open
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void oncategorySelected(category) {
    categoryDate = category;
    setState(() {});
  }
}
