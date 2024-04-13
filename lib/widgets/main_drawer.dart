import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        tapHandler();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          // color: ,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile(
          'Restaurant',
          Icons.restaurant,
          () {
            Navigator.of(context).pushReplacementNamed('/');
            // instead of pushNamed to not add new one on the stack, removes back button
          },
        ),
        buildListTile(
          'Settings',
          Icons.settings,
          () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
        ),
      ]),
    );
  }
}
