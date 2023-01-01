import 'package:flutter/material.dart';

import '../models/SourceResponce.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelcted;

  TabItem(this.sources, this.isSelcted);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelcted ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green),
      ),
      child: Text(
        sources.name ?? "",
        style: TextStyle(color: isSelcted ? Colors.white : Colors.green),
      ),
    );
  }
}
