import 'package:flutter/material.dart';

// import 'package:black_kitchen/screens/tabs_screen.dart';
// import 'package:black_kitchen/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianSet = false;
  var _veganSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianSet = widget.currentFilters[Filter.vegetarian]!;
    _veganSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (indentifier) {
      //     Navigator.of(context).pop();
      //     if (indentifier == 'meals') {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeSet,
            Filter.lactoseFree: _lactoseFreeSet,
            Filter.vegetarian: _vegetarianSet,
            Filter.vegan: _veganSet,
          });
        },
        child: Column(
          children: [
            // Gluten-free
            SwitchListTile(
              value: _glutenFreeSet,
              onChanged: (isCheked) {
                setState(() {
                  _glutenFreeSet = isCheked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Colors.green,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
            // Lactose-free
            SwitchListTile(
              value: _lactoseFreeSet,
              onChanged: (isCheked) {
                setState(() {
                  _lactoseFreeSet = isCheked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Colors.green,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
            // Vegetarian
            SwitchListTile(
              value: _vegetarianSet,
              onChanged: (isCheked) {
                setState(() {
                  _vegetarianSet = isCheked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegeterian meals',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Colors.green,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
            // Vegan
            SwitchListTile(
              value: _veganSet,
              onChanged: (isCheked) {
                setState(() {
                  _veganSet = isCheked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Colors.green,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      ),
    );
  }
}
