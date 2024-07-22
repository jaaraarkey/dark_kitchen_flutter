import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 300,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.9)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Row(
                children: [
                  // Icon(Icons.restaurant,
                  //     size: 36, color: Theme.of(context).colorScheme.onPrimary),
                  // const SizedBox(width: 16),
                  Text(
                    'Menu',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
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
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, size: 24),
              title: Text('Settings',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
              onTap: () {
                // todo implement settings screen, routing
                ;
              },
            ),
          ],
        ));
  }
}
