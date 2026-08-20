import 'package:flutter/material.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/models/coffee.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/coffee_tile.dart';
import 'dart:ui';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List menuItems = [
    Coffee (name: 'Latte Macchiato', price: 4.99, imagePath: 'lib/images/latte_macchiato.png', rating: '4.5'),
    Coffee (name: 'Cappuccino', price: 3.99, imagePath: 'lib/images/cappuccino.png', rating: '4.0'),
    Coffee (name: 'Espresso', price: 2.99, imagePath: 'lib/images/espresso.png', rating: '4.2'),
    Coffee (name: 'Iced Coffee', price: 5.49, imagePath: 'lib/images/iced_coffee.png', rating: '4.3'),
    Coffee (name: 'Black Coffee', price: 4.49, imagePath: 'lib/images/black_coffee.png', rating: '4.1'),
    Coffee (name: 'Caramel Whipped Coffee', price: 5.99, imagePath: 'lib/images/caramel_whipped_coffee.png', rating: '4.4'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: primaryColor,
        ),
        title: Text(
          'Menu',
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 1, 123, 87),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text('Get 20% Promo', 
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // promo button
                    MyButton(text: 'Redeem', onTap: () {

                    }),
                  ],
                ),

                // promo image
                const SizedBox(width: 20),
                Image.asset(
                  'lib/images/iced_coffee.png',
                  height: 120,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25.0),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for coffee...',
                prefixIcon: const Icon(Icons.search),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 25.0),

          // menu items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Coffee Menu',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menuItems.length,
                itemBuilder: (context, index) => SizedBox(
                  child: CoffeeTile(coffee: menuItems[index]),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // popular items
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/latte_macchiato.png',
                      height: 100,
                    ),

                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Latte Macchiato',
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          '\$4.99',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Icon(
                  Icons.favorite_outline, 
                  color: Colors.red,
                  size: 28
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}