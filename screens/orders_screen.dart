import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(204, 252, 189, 117), // Background color
      body: ScrollConfiguration(
        behavior: SmoothScrollBehavior(),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('orders')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final orders = snapshot.data!.docs;

            if (orders.isEmpty) {
              return const Center(
                child: Text('No orders found in Firestore.'),
              );
            }

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index].data() as Map<String, dynamic>;
                final orderId = orders[index].id; // Get the order ID

                // Extract the "items" field and convert it to a List<dynamic>
                final List<dynamic> items = order['items'];
                bool isOrderDone =
                    order['isDone'] ?? false; // Check if the order is done

                return Card(
                  color: isOrderDone
                      ? Colors.green
                      : Color.fromARGB(204, 227, 192, 95),
                  shadowColor: Colors.amber,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(170, 248, 195, 89)
                              .withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  'Table Number: ${order['tableNumber']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Kanit',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Order Time: ${DateFormat('dd/MM/yyyy HH:mm').format(order['timestamp'].toDate())}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Kanit',
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Column(
                                children: items.map((item) {
                                  final itemName = item['itemName'];
                                  final quantity = item['quantity'];
                                  final price = item['price'];
                                  final totalPrice = quantity * price;
                                  final ImageUrl = item['ImageUrl'];

                                  return Card(
                                    color: Color.fromARGB(203, 245, 199, 61),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(4),
                                      leading: ClipOval(
                                        child: Image.network(
                                          ImageUrl,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        "$itemName",
                                        style: const TextStyle(
                                          fontFamily: 'Kanit',
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      subtitle: Text('Quantity: $quantity',
                                          style: const TextStyle(
                                              fontFamily: 'Kanit',
                                              fontSize: 14.0)),
                                      trailing: Text(
                                        '₹${totalPrice.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 4, bottom: 4),
                                child: Text(
                                  'Total Price: ₹${order['totalPrice']}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  markOrderAsDone(orderId);
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: isOrderDone
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                                child: Text(
                                  isOrderDone ? 'Done' : 'Mark as Done',
                                  style: TextStyle(
                                    fontFamily: 'Kanit',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void markOrderAsDone(String orderId) {
    // Implement the logic to toggle the order status (done or not done)
    FirebaseFirestore.instance.collection('orders').doc(orderId).update({
      'isDone': true, // Mark the order as done
    });
  }
}

class SmoothScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
