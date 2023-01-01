import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryDate categoryDate;
  int index;

  CategoryItem(this.categoryDate, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: index.isOdd ? Radius.circular(25) : Radius.zero,
              bottomRight: index.isEven ? Radius.circular(25) : Radius.zero)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                child: Image.asset(
              categoryDate.images,
              height: 100,
            )),
          ),
          Text(
            categoryDate.title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
