import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/meal_Item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMael;
  FavouriteScreen(this.favouriteMael);

  @override
  Widget build(BuildContext context) {
    if (favouriteMael.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text("You have no favourute yet - start adding some"),
        ),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favouriteMael[index].id,
              title: favouriteMael[index].title,
              imageurl: favouriteMael[index].imageUrl,
              duration: favouriteMael[index].duration,
              complexity: favouriteMael[index].complexity,
              affordability: favouriteMael[index].affordability,
            );
          },
          itemCount: favouriteMael.length,
        ),
      );
    }
  }
}
