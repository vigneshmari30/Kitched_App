import 'package:flutter/material.dart';

import './dummy_data.dart';
import './categoryitem.dart';
import './categorymeal.dart';

class CategoryScreen extends StatelessWidget {
  void selectedScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CategoryMeal();
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOTEL"),
      ),
      body: InkWell(
        onTap: () => selectedScreen(context),
        splashColor: Theme.of(context).primaryColor,
        child: GridView(
          children: DUMMY_CATEGORIES.map((cData) {
            return CategoryItem(cData.title, cData.color);
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
        ),
      ),
    );
  }
}
