import 'package:flutter/material.dart';
import 'package:news0/screens/tab_item.dart';
import 'package:news0/shared/network/remote/api_manger.dart';

import '../models/NewsDataModel.dart';
import '../models/SourceResponce.dart';
import 'news_Item.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;

  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sources
                  .map(
                    (source) => Tab(
                      child: TabItem(source,
                          widget.sources.indexOf(source) == selectedIndex),
                    ),
                  )
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
          future: ApiManger.getNewsData(widget.sources[selectedIndex].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
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

            var newsData = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(newsData[index]);
                },
                itemCount: newsData.length,
              ),
            );
          },
        )
      ],
    );
  }
}
