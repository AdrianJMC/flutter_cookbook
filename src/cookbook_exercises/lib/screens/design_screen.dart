import 'package:flutter/material.dart';

void main() => runApp(DesignScreen());

class DesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Design',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: Colors.orangeAccent,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Features'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                ),
              ),
              child: Text(
                'Navigation Menu',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListTile(
              leading: Icon(Icons.grid_view, color: Colors.orangeAccent),
              title: Text('Orientation Grid'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrientationGridPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.tab, color: Colors.orangeAccent),
              title: Text('Tabs Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabsExamplePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.message, color: Colors.orangeAccent),
              title: Text('SnackBar Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SnackBarExamplePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Start Exploring!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

class OrientationGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Grid'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.all(10),
            children: List.generate(20, (index) {
              return Card(
                color: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class TabsExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs Example'),
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            tabs: [
              Tab(icon: Icon(Icons.directions_car, color: Colors.white), text: 'Car'),
              Tab(icon: Icon(Icons.directions_transit, color: Colors.white), text: 'Transit'),
              Tab(icon: Icon(Icons.directions_bike, color: Colors.white), text: 'Bike'),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: TabBarView(
          children: [
            Center(child: Icon(Icons.directions_car, size: 50, color: Colors.orangeAccent)),
            Center(child: Icon(Icons.directions_transit, size: 50, color: Colors.orangeAccent)),
            Center(child: Icon(Icons.directions_bike, size: 50, color: Colors.orangeAccent)),
          ],
        ),
      ),
    );
  }
}

class SnackBarExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar Example'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Here is a SnackBar!'),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('Show SnackBar', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
