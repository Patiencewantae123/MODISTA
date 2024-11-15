import 'package:flutter/material.dart';
import 'package:modista_fashion_app/home_screen.dart';
import 'package:modista_fashion_app/profile_screen.dart' show ProfileScreen; // ProfileScreen will be correctly imported from here
import 'package:modista_fashion_app/explore_screen.dart' as explore; // Alias used for ExploreScreen

void main() => runApp(const ModistaApp());

class ModistaApp extends StatelessWidget {
  const ModistaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modista Kenya Modern Fashion',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  
  // Corrected the import references with appropriate screen widgets
  final List<Widget> _screens = [
    HomeScreen(),
    explore.ExploreScreen(),  // Using alias for ExploreScreen
    ProfileScreen(),          // Imported directly from profile_screen.dart
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
  
  
}
