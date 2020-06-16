import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id,this.title, this.color);

  void selectedScreen(context) {
    Navigator.of(context)
        .pushNamed('/category-meal', arguments: {'id': id, 'title': title});
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedScreen(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(20),
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
