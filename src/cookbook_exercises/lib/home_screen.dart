import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';
import './main.dart'; // Importa MyAppState para acceder a los datos
import './screens/word_pair_screen.dart'; // Importa la pantalla de generación de pares de palabras
import './screens/favorites_screen.dart'; // Importa la pantalla de favoritos
import './screens/design_screen.dart'; // Importa la pantalla de favoritos
import './screens/images_screen.dart'; // Importa la pantalla de favoritos
import './screens/list_screen.dart'; // Importa la pantalla de favoritos
import './screens/navigation_screen.dart'; // Importa la pantalla de favoritos




class HomeScreen extends StatelessWidget {
  void _showMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 400,  // Ajusta la altura del diálogo
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildMenuItem(
                    context,
                    Icons.design_services,
                    'DESIGN',
                    DesignScreen(),
                  ),
                  _buildMenuItem(
                    context,
                    Icons.list,
                    'LIST',
                    ListScreen(),
                  ),
                  _buildMenuItem(
                    context,
                    Icons.image,
                    'IMAGE',
                    ImagesScreen(),
                  ),
                  _buildMenuItem(
                    context,
                    Icons.navigation,
                    'NAVIGATION',
                    NavigationScreen(),
                  ),
                  _buildMenuItem(
                    context,
                    Icons.star,
                    'WORD PAIR GENERATOR',  // Nueva opción para la pantalla de generación de pares de palabras
                    WordPairScreen(),
                  ),
                  _buildMenuItem(
                    context,
                    Icons.favorite,
                    'FAVORITES',  // Nueva opción para la pantalla de favoritos
                    FavoritesScreen(),
                  ),
                  SizedBox(height: 10),  // Un poco de espacio antes de "Favorites"
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, Widget screen) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);  // Cierra el diálogo antes de navegar
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,  // Mueve los elementos más arriba
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),  // Ajusta el espacio superior
            Text(
              'Cookbook exercises',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),  // Ajusta el espacio entre el texto y el botón
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 198, 8, 179),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              ),
              onPressed: () => _showMenu(context),  // Muestra el menú al hacer clic
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.menu),
                  SizedBox(width: 60),
                  Text(
                    'MENU',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
