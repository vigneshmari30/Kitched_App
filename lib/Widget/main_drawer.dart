import 'package:flutter/material.dart';

import '../screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget listBuilder(String input, IconData iconer, Function pageTap) {
      return ListTile(
          leading: Icon(iconer),
          title: Text(
            input,
            style: Theme.of(context).textTheme.headline6,
          ),
          onTap: pageTap);
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              "Cooking App",
              style: Theme.of(context).textTheme.headline3,
            ),
            height: 120,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(10),
          ),
          listBuilder("Meals", Icons.kitchen, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          listBuilder("Filter", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.filter);
          })
        ],
      ),
    );
  }
}
