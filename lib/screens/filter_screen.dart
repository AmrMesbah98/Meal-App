import 'package:flutter/material.dart';
import 'package:meal_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'FilterScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool GlutenFree = false;

  bool LactoseFree = false;

  bool Vegan = false;

  bool Vegetarian = false;

  Widget switchbuilder(String text, bool currentvalue, Function updatevalue) {
    return SwitchListTile(
      value: currentvalue,
      onChanged: updatevalue,
      title: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fliter!"),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              "Only include gluten-free meal.",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                switchbuilder("GlutenFree", GlutenFree, (value) {
                  setState(() {
                    GlutenFree = value;
                  });
                }),
                switchbuilder("LactoseFree", LactoseFree, (value) {
                  setState(() {
                    LactoseFree = value;
                  });
                }),
                switchbuilder("Vegan", Vegan, (value) {
                  setState(() {
                    Vegan = value;
                  });
                }),
                switchbuilder("Vegetarian", Vegetarian, (value) {
                  setState(() {
                    Vegetarian = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
