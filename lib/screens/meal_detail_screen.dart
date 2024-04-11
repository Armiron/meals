import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) => Card(
                // color: Colors.redAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          buildContainer(
            ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context, index) => Column(children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Text('#${(index + 1)}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider(),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
