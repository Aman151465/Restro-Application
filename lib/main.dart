import 'dart:ui';
import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
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

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/4046718/pexels-photo-4046718.jpeg?auto=compress&cs=tinysrgb&w=400', // Replace with your image URL
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset('assets/images/IMG-20230824-WA0104.jpg'),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 30),
                  child: Text(
                    'We are glad to have you here ! ❤️',
                    style: TextStyle(
                      color: Color.fromARGB(255, 14, 9, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Kanit',
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 30, top: 30),
                  child: Text(
                    'We offer a variety of delicious dishes to choose from.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 15, 10, 0),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 30),
                  child: Text(
                    'Please take a look at our menu and order what you like.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 14, 9, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.orange, // Change the button's background color
                    foregroundColor: Color.fromARGB(
                        255, 11, 8, 1), // Change the text (label) color
                    minimumSize:
                        const Size(150, 50), // Change the button's dimensions
                    padding:
                        const EdgeInsets.all(10), // Change the button's padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Order',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RestaurantApp()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
