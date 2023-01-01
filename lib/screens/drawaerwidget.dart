import 'package:flutter/material.dart';

class DrawaerWidget extends StatelessWidget {
  Function onDrawaerSelected;

  DrawaerWidget(this.onDrawaerSelected);

  static int CATEGORYIES = 1;
  static int SETTINGS = 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              alignment: Alignment.center,
              color: Colors.green,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Text(
                'News APP',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
          InkWell(
            onTap: () {
              onDrawaerSelected(CATEGORYIES);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawaerSelected(SETTINGS);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Setting',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
