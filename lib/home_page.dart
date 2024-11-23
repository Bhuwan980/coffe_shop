import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // getting the width of the device
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.03),
          child: const Icon(
            Icons.circle,
            size: 60,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: const Icon(
              Icons.notifications_outlined,
              size: 50,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'hey cofee',
          style: TextStyle(fontFamily: 'Cera', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
