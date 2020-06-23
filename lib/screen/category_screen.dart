import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../Widget/categoryitem.dart';

class CategoryScreen extends StatelessWidget {
  

  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES.map((cData) {
        return CategoryItem(cData.id, cData.title, cData.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
    );
  }
}
