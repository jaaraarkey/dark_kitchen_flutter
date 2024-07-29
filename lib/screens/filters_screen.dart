import 'package:flutter/material.dart';
import 'package:black_kitchen/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  // void initState() {
  //   super.initState();
  //   final activeFilters = ref.read(filtersProvider);
  //   _glutenFreeSet = activeFilters[Filter.glutenFree]!;
  //   _lactoseFreeSet = activeFilters[Filter.lactoseFree]!;
  //   _vegetarianSet = activeFilters[Filter.vegetarian]!;
  //   _veganSet = activeFilters[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(filtersProvider);
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('filters'),
      ),
      body: Column(
        children: [
          // Gluten-free
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isCheked);
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
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isCheked);
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
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isCheked);
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
            value: activeFilters[Filter.vegan]!,
            onChanged: (isCheked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isCheked);
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
    );
  }
}
