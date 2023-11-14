// import 'package:flutter/material.dart';

// class WaitingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const CircularProgressIndicator(
//               backgroundColor: Colors.orange,
//             ),
//             const SizedBox(height: 16.0),
//             const Text(
//               'Your order is being processed...',
//               style: TextStyle(fontSize: 18.0, fontFamily: 'Kanit'),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange,
//                 foregroundColor: Colors.white,
//                 minimumSize: const Size(150, 30),
//                 padding: const EdgeInsets.all(16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: const Text(
//                 'Pay',
//                 style: TextStyle(
//                   fontFamily: 'Kanit',
//                 ),
//               ),
//               onPressed: () {
//                 // Show the QR code image in a popup dialog.
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text(
//                         'Payment QR Code',
//                         style: TextStyle(
//                           fontFamily: 'Kanit',
//                         ),
//                       ),
//                       content: Container(
//                         height: 250, // Adjust the height as needed
//                         width: 250,
//                         child: Image.asset(
//                           'assets/images/QR_code.jpg', // Adjust the image path
//                           fit: BoxFit
//                               .cover, // You can use BoxFit.fill to fill the container
//                         ),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: const Text(
//                             'Close',
//                             style: TextStyle(
//                               fontFamily: 'Kanit',
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop(); // Close the popup
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WaitingScreen extends StatelessWidget {
  final String upiId;

  WaitingScreen({required this.upiId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.amber,
          shadowColor: Color.fromARGB(255, 187, 63, 32),
          elevation: 10, // Optional: Add elevation to the card
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                QrImageView(
                  data: 'upi://pay?pa=$upiId',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                SizedBox(height: 20),
                Text('Scan the QR code for payment'),
                SizedBox(height: 20),
                // Text(upiId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}