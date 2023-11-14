import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AdminPanelScreen extends StatefulWidget {
  @override
  _AdminPanelScreen createState() => _AdminPanelScreen();
}

class _AdminPanelScreen extends State<AdminPanelScreen> {
  String name = 'Amarnath Sharma';
  String email = 'aman151465@gmail.com';
  String bio =
      'I have an energetic and dynamic presence. I may have a youthful and approachable demeanor, reflecting my enthusiasm for technology and innovation. My appearance is characterized by the casual yet professional attire, which often includes comfortable clothing suited for long hours of coding, mixed with the trendy fashion sense of a young techie.';
  String Number = '8788029774';
  String? photoUrl;

  void initState() {
    super.initState();
    photoUrl =
        'https://imgs.search.brave.com/cTEm8sREtNMSKP-6JUhTYwxbmGVWeUNXx-uqioiPJbo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NDQ3MDM2ODY5ODEt/YTNhYmJjNGQ0ZmUz/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4T0h4/OGNHbGpkSFZ5Wlh4/bGJud3dmSHd3Zkh4/OE1BPT0mdz0xMDAw/JnE9ODA.jpeg';
  }

  // A method that builds the widget tree for this widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 400,
              color: Color.fromARGB(212, 242, 192, 42),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Adjust the alignment as needed
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                          'https://imgs.search.brave.com/cTEm8sREtNMSKP-6JUhTYwxbmGVWeUNXx-uqioiPJbo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE0/NDQ3MDM2ODY5ODEt/YTNhYmJjNGQ0ZmUz/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4T0h4/OGNHbGpkSFZ5Wlh4/bGJud3dmSHd3Zkh4/OE1BPT0mdz0xMDAw/JnE9ODA.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(name),
              ),
            ),
            const SizedBox(height: 8.0),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: const Icon(Icons.email),
                title: Text(email),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.description),
                title: Text(bio),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: const Icon(Icons.contact_page),
                title: Text(Number),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
