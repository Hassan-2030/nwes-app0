import 'package:flutter/material.dart';
import 'package:news0/models/category.dart';
import 'package:news0/screens/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function oncategorySelected;

  CategoriesScreen(this.oncategorySelected);

  @override
  Widget build(BuildContext context) {
    var categoryies = CategoryDate.getCategories();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick your categories of interest',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        oncategorySelected(categoryies[index]);
                      },
                      child: CategoryItem(categoryies[index], index));
                },
                itemCount: categoryies.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
