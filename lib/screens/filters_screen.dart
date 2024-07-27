import 'package:flutter/material.dart';
import 'package:black_kitchen/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  // final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianSet = false;
  var _veganSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianSet = activeFilters[Filter.vegetarian]!;
    _veganSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('filters'),
      ),
      // drawer: MainDrawer(

      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeSet,
            Filter.lactoseFree: _lactoseFreeSet,
            Filter.vegetarian: _vegetarianSet,
            Filter.vegan: _veganSet,
          });
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
