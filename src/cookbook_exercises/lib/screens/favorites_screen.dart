import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart'; // Importa MyAppState para acceder a los favoritos

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Scaffold(  // Agregar Scaffold aquí
        appBar: AppBar(title: Text('Favorites')),
        body: Center(
          child: Text('No favorites yet.'),
        ),
      );
    }

    return Scaffold(  // Agregar Scaffold aquí también
      appBar: AppBar(title: Text('Favorites')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${appState.favorites.length} favorites:'),
          ),
          for (var pair in appState.favorites)
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
            ),
        ],
      ),
    );
  }
}

