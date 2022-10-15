import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  Widget drawertext(IconData icon, String text, Function tab_handler) {
    return ListTile(
      onTap: tab_handler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column( 
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(
              "CookingUp!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          drawertext(Icons.restaurant, "Meal", () {
            Navigator.of(context).pushNamed('/');
          }),
          drawertext(Icons.settings, "filtter", () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
