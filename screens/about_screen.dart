import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 218, 129),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Restaurant Cover Photo
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://imgs.search.brave.com/r6t9otKYDyORTPryK70GAQj2uKUx5_h_CM_QKq9ypjQ/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTQw/OTczMDU2OS9waG90/by9tYW4tYXQtYS1y/ZXN0YXVyYW50LWFz/a2luZy1hLXF1ZXN0/aW9uLXRvLXRoZS13/YWl0cmVzcy1hYm91/dC10aGUtbWVudS53/ZWJwP2I9MSZzPTE3/MDY2N2Emdz0wJms9/MjAmYz05QUdjY09O/S3VFd1ZmdGtEQmZZ/NnBTY01jM0FFR2pP/cVVZR1JxQzk4Wk9j/PQ', // Replace with your restaurant's cover photo URL
                    ),
                    fit: BoxFit.cover, // You can adjust the BoxFit as needed
                  ),
                ),
              ),

              // Restaurant Logo and Info
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // CircleAvatar(
                    //   radius: 60.0,
                    //   backgroundImage: NetworkImage(
                    //     'https://imgs.search.brave.com/YuURFlMn0gTr-E7cpdpEyBrycdj6Q0ZzgF2bKZoKDBY/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5zcHJvdXRzb2Np/YWwuY29tL3VwbG9h/ZHMvMjAyMi8wNi9w/cm9maWxlLXBpY3R1/cmUuanBlZw', // Replace with your restaurant's logo URL
                    //   ),
                    // ),
                    SizedBox(height: 16.0),
                    Text(
                      'My Restaurant', // Replace with your restaurant's name
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cuisine Type: Indian', // Replace with cuisine type or description
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Mumbai, Virar (E)',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Contact: aman@myrestaurant.com', // Replace with contact information
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Restaurant Description
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Nestled in the vibrant neighborhood of Virar East, Mumbai, Restroo is a culinary haven that promises a delightful dining experience for both locals and visitors alike. From its warm and inviting ambiance to its diverse and delectable menu, Restroo offers a perfect blend of flavors, aromas, and hospitality that will leave you craving for more.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "AMBIANCE: As you step into Restroo, you'll be greeted by a cozy and welcoming atmosphere. The restaurant's decor is a fusion of contemporary elegance and traditional charm, featuring soothing lighting, comfortable seating, and tasteful artwork. Whether you're celebrating a special occasion or enjoying a casual meal with friends and family, Restroo provides the ideal setting.",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),

              // Restaurant Images (e.g., Interior, Dishes)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Restaurant Images',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    // Replace with images of the restaurant's interior, dishes, etc.
                    Image.network(
                      'https://imgs.search.brave.com/43-9GycyCFFxlMTV1L14F9-sv28r6aAiPNnVaK5TclI/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9y/ZXN0YXVyYW50LWlu/dGVyaW9yXzExMjct/MzM5NC5qcGc_c2l6/ZT02MjYmZXh0PWpw/Zw',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8.0),
                    Image.network(
                      'https://imgs.search.brave.com/ZWgJDvNoSehI0-IiQxiOYqv3HIljPP_s8aN4hapPUwU/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/OTA4NDY0MDY3OTIt/MGFkYzdmOTM4ZjFk/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4T1h4/OGNtVnpkR0YxY21G/dWRIeGxibnd3Zkh3/d2ZIeDhNQT09Jnc9/MTAwMCZxPTgw.jpeg',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Add more images as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
