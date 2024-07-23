import 'package:black_kitchen/data/dummy_data.dart';
import 'package:black_kitchen/screens/categories.dart';
import 'package:black_kitchen/screens/meals.dart';
import 'package:black_kitchen/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:black_kitchen/models/meal.dart';
import 'package:black_kitchen/screens/filters_screen.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
  });
  @override
  // State<_TabsScreenState> createState() => _TabsScreenState();
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleFavoriteStatus(Meal meal) {
    final isInFavorites = _favoriteMeals.contains(meal);
    if (isInFavorites) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage(context, 'Removed from favorites');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });

      _showInfoMessage(context, 'Added to favorites');
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget selectedPage = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteStatus,
      availableMeals: availableMeals,
    );
    var selectedPageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      selectedPage = MealsScreen(
        meals: _favoriteMeals,
        title: null,
        onToggleFavorite: (Meal meal) {},
      );
      selectedPageTitle = 'Favorites';
    }

    void setPage(String indentifier) async {
      Navigator.of(context).pop();

      if (indentifier == 'filters') {
        final result = await Navigator.of(context).push<Map<Filter, bool>>(
            MaterialPageRoute(
                builder: (ctx) =>
                    FiltersScreen(currentFilters: _selectedFilters)));
        setState(() {
          _selectedFilters = result ?? kInitialFilters;
        });
      }
      //  else {
      //   Navigator.of(context).pop();
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: setPage,
      ),
      body: selectedPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedIconTheme: selectedPageTitle == 'Favorites'
            ? const IconThemeData(color: Colors.white)
            : const IconThemeData(color: Colors.white),
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.food_bank_sharp,
                size: 30,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
