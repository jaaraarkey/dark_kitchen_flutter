import 'package:black_kitchen/providers/meals_provider.dart'; // Importing meals_provider.dart file
import 'package:black_kitchen/screens/categories.dart'; // Importing categories.dart file
import 'package:black_kitchen/screens/meals.dart'; // Importing meals.dart file
import 'package:black_kitchen/widgets/main_drawer.dart'; // Importing main_drawer.dart file
import 'package:flutter/material.dart'; // Importing the material package from Flutter
import 'package:black_kitchen/screens/filters_screen.dart'; // Importing filters_screen.dart file
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Importing the flutter_riverpod package
import 'package:black_kitchen/providers/favorites_provider.dart'; // Importing favorites_provider.dart file
import 'package:black_kitchen/providers/filters_provider.dart'; // Importing filters_provider.dart file

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
}; // Defining a constant map of initial filters

class TabsScreen extends ConsumerStatefulWidget {
  // Defining a class named TabsScreen that extends ConsumerStatefulWidget
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  // Defining a class named _TabsScreenState that extends ConsumerState<TabsScreen>
  int _selectedPageIndex = 0; // Initializing the selected page index with 0

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index; // Updating the selected page index
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);

    final availableMeals = meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget selectedPage = CategoriesScreen(
      // Initializing the selectedPage widget with CategoriesScreen
      availableMeals: availableMeals,
    );
    var selectedPageTitle =
        'Categories'; // Initializing the selectedPageTitle variable with 'Categories'

    if (_selectedPageIndex == 1) {
      // Checking if the selected page index is 1
      final favorites = ref.watch(
          favoritesProvider); // Accessing the favoritesProvider using the ref.watch method
      selectedPage = MealsScreen(
        // Updating the selectedPage widget with MealsScreen
        meals: favorites,
        title: null,
      );
      selectedPageTitle =
          'Favorites'; // Updating the selectedPageTitle variable with 'Favorites'
    }

    void setPage(String indentifier) async {
      // Defining a function to set the page
      Navigator.of(context).pop(); // Closing the drawer

      if (indentifier == 'filters') {
        await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
            builder: (ctx) => const FiltersScreen(),
          ),
        );
      }
    }

    return Scaffold(
      // Returning a Scaffold widget
      appBar: AppBar(
        title: Text(selectedPageTitle), // Setting the title of the AppBar
      ),
      drawer: MainDrawer(
        // Setting the drawer of the Scaffold
        onSelectScreen: setPage,
      ),
      body: selectedPage, // Setting the body of the Scaffold
      bottomNavigationBar: BottomNavigationBar(
        // Setting the bottom navigation bar of the Scaffold
        currentIndex:
            _selectedPageIndex, // Setting the current index of the bottom navigation bar
        selectedIconTheme: selectedPageTitle == 'Favorites'
            ? const IconThemeData(color: Colors.white)
            : const IconThemeData(color: Colors.white),
        onTap:
            _selectedPage, // Setting the onTap callback for the bottom navigation bar
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
