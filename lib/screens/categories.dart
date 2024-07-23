import 'package:black_kitchen/data/dummy_data.dart';
import 'package:black_kitchen/screens/meals.dart';
import 'package:black_kitchen/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:black_kitchen/models/meal.dart';
import 'package:black_kitchen/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.availableMeals});

  void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealsScreen(
        title: category.title,
        meals: filteredMeals,
        onToggleFavorite: onToggleFavorite,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 6 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
