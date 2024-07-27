import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String indentifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 300,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 255, 2, 78),
                  Color.fromARGB(255, 255, 2, 78),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Row(
                children: [
                  Text(
                    'Menu',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.restaurant, size: 24),
              title: Text('Meals',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                onSelectScreen('meals');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, size: 24),
              title: Text('filters',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                onSelectScreen('filters');
              },
            ),
          ],
        ));
  }
}
