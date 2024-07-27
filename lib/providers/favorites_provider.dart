import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:black_kitchen/models/meal.dart';

/// A notifier class that manages the list of favorite meals.
class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  /// Toggles the favorite status of a meal.
  ///
  /// If the meal is already a favorite, it will be removed from the list of favorites.
  /// If the meal is not a favorite, it will be added to the list of favorites.
  bool toggleFavoriteMealStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

/// A provider that creates and manages an instance of [FavoritesNotifier].
final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) {
  return FavoritesNotifier();
});
