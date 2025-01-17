import 'package:flutter/material.dart';

class ImagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images Section'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 198, 8, 179),
              ),
              child: Text(
                'Images Exercises',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.image_outlined),
              title: Text('Image from Internet Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageFromInternetExample()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.image_search),
              title: Text('Fade In Image Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FadeInImageExample()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Select an image exercise from the drawer menu'),
      ),
    );
  }
}



class ImageFromInternetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image from Internet Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FadeInImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fade In Image Example'),
      ),
      body: Stack(
        children: <Widget>[
          const Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png', // Asegúrate de tener esta imagen en tu proyecto
              image: 'https://picsum.photos/250?image=9',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}