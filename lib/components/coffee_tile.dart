import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String name;
  final double price;
  final String imagePath;
  final String rating;

  const CoffeeTile({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            // Coffee Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
      
            // Coffee Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text('\$${price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 5),
                      Text(rating, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
      
            // Add to Cart Button
            ElevatedButton(
              onPressed: () {
                // Handle add to cart action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Icon(Icons.add_shopping_cart, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}