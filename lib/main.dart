import 'package:flutter/material.dart';

import 'layout/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeScreen.routName ,
      routes: {
        HomeScreen.routName:(context) => HomeScreen()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
  }
}

