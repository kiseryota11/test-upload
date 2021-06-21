import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SearchPage.dart';
import 'PostPage.dart';
import 'LikedPage.dart';
import 'ProfilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inxtagram',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final Tabs = [
    HomePage(),
    SearchPage(),
    PostPage(),
    LikedPage(),
    ProfilePage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inxtagram'),
      ),
      backgroundColor: Colors.white,
      body: Tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Post'),
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            title: Text('Liked'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
          ),
        ],
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
      ),
    );
  }
}
