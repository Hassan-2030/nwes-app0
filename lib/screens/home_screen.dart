import 'package:flutter/material.dart';
import 'package:news0/models/category.dart';
import 'package:news0/screens/tab_controller.dart';

import '../models/SourceResponce.dart';
import '../shared/network/remote/api_manger.dart';

class HomeScreen extends StatelessWidget {
  CategoryDate categoryDate;

  HomeScreen(this.categoryDate);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponce>(
      future: ApiManger.getSources(categoryDate.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
              child: Column(
            children: [
              Text('Something went wrong '),
              TextButton(onPressed: () {}, child: Text('try Again'))
            ],
          ));
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? 'Error'),
              TextButton(onPressed: () {}, child: Text('try Again'))
            ],
          );
        }
        var sources = snapshot.data?.sources ??= [];
        return TabControllerScreen(sources!);
      },
    );
  }
}
