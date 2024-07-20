import 'package:black_kitchen/screens/meal_details.dart';
import 'package:black_kitchen/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:black_kitchen/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length, // Ensure you specify the itemCount
      itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (BuildContext context, Meal meal) {
            selectMeal(context, meal);
          }),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.values[0],
          children: [
            Text(
              'Nothings here...',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 16),
            // const Icon(Icons.sentiment_dissatisfied, size: 48),
            const SizedBox(height: 16),
            Text(
              'Please choose another category.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      );
    }

    // Return the content Widget at the end of the build method
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
