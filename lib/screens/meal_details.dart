import 'package:black_kitchen/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  void Function(Meal meal) onToggleFavorite;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              size: 30,
            ),
            onPressed: () {
              onToggleFavorite(meal);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Ingredients',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              for (final ingredients in meal.ingredients)
                Text(ingredients,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        )),
              const SizedBox(height: 16),
              for (final step in meal.steps)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text('Step ${meal.steps.indexOf(step) + 1}',
                    //     style: Theme.of(context)
                    //         .textTheme
                    //         .titleMedium!
                    //         .copyWith(
                    //             color: Theme.of(context).colorScheme.onSurface,
                    //             fontWeight: FontWeight.bold)),
                    // // const SizedBox(height: 8),
                    Text('- $step',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            )),
                    const SizedBox(height: 4),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
