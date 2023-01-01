import 'package:flutter/material.dart';

class CategoryDate {
  String id;
  String title;
  String images;
  Color color;

  CategoryDate(this.id, this.title, this.images, this.color);

  static List<CategoryDate> getCategories() {
    return [
      CategoryDate(
          'sports', 'Sports', 'assets/images/ball.png', Color(0xFFC91C22)),
      CategoryDate('bussines', 'Bussines', 'assets/images/bussines.png',
          Color(0xFFC2DC51)),
      CategoryDate('environment', 'Environment',
          'assets/images/environment.png', Color(0xFF1C73C9)),
      CategoryDate(
          'health', 'Health', 'assets/images/health.png', Color(0xFF1CC961)),
      CategoryDate('politics', 'Politics', 'assets/images/Politics.png',
          Color(0xFFEE5439)),
      CategoryDate(
          'science', 'Science', 'assets/images/science.png', Color(0xFFEE39DF)),
    ];
  }
}
