import 'package:flutter/material.dart';

class CoffeeCard extends StatefulWidget {
  final String coffeeTitle;
  const CoffeeCard({super.key, required this.coffeeTitle});

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  @override
  Widget build(BuildContext context) {
   // final cardSize = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8), // Padding outside the card for spacing
      height: 270, // Card height as before
      width: 150, // Card width as before
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 247, 241),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section with padding around it
          Padding(
            padding: const EdgeInsets.all(8.0), // Padding around the image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners for the image
              child: Image.asset(
                'assets/images/latte.png', // Your image asset
                height: 100, // Square image size (height = width)
                width: 130, // Square image size (width = height)
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Coffee title
          Text(
            widget.coffeeTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          
          // Description
          const Text(
            'With chocolate and melons for the ',
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
          
          // Row for price and add button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$4.99', // Price text
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add button in circular shape
              GestureDetector(
                onTap: () {
                  // Handle add to cart functionality here
                },
                child: CircleAvatar(
                  radius: 18, // Circular button
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}