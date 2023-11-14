import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app/widgets/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      home: const CustomBottomNavigationBar(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Kanit',
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
