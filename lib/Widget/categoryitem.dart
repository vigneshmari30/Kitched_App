import 'package:flutter/material.dart';

import '../screen/categorymeal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectedScreen(context) {
    Navigator.of(context).pushNamed(CategoryMeal.mealRoute,
        arguments: {'id': id, 'title': title});
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
