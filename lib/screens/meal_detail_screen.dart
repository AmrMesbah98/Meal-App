import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_details';

  final Function favouritemeal;
  final Function isfavourite;
  MealDetailsScreen(this.favouritemeal, this.isfavourite);

  Widget titleTtext(BuildContext context, String topic) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        topic,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget Build_Container(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 300,
      height: 150,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectmeal = DUMMY_MEALS.firstWhere((mela) => mela.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            titleTtext(context, "Ingrediant"),
            Build_Container(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectmeal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  );
                },
                itemCount: selectmeal.ingredients.length,
              ),
            ),
            titleTtext(context, "Steps"),
            Build_Container(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(selectmeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.black,
                    )
                  ],
                );
              },
              itemCount: selectmeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => favouritemeal(mealID),
        child:
            Icon(isfavourite(mealID) ? Icons.star : Icons.star_border_outlined),
      ),
    );
  }
}
