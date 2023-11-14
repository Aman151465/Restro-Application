import 'package:flutter/material.dart';
import '../screens/about_screen.dart';
import '../screens/admin_panel_screen.dart';
import '../screens/orders_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    AdminPanelScreen(),
    OrdersScreen(),
    AboutScreen(),
  ];

  final List<String> _appBarTitles = ['ADMIN', 'ORDERS', 'ABOUT'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 200, 129),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(207, 248, 171, 57),
        title: Text(_appBarTitles[_currentIndex],
            style: TextStyle(
              fontFamily: 'kanitf',
              fontSize: 22,
            )), // Display the selected title
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Color.fromARGB(195, 249, 184, 87),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
