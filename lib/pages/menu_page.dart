import 'package:flutter/material.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/models/shop.dart';
import 'package:flutter_app/pages/coffee_details_page.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/coffee_tile.dart';
import 'dart:ui';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  // Navigate to coffee item details page
  void navigateToCoffeeDetails(int index){
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final coffeeMenu = shop.coffeeMenu;

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => CoffeeDetailsPage(
          coffee: coffeeMenu[index],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // get the shop and it's menu
    final shop = context.read<Shop>();
    final coffeeMenu = shop.coffeeMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: const Text('Owl Coffee'),
        actions: [
          // cart button
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            }, icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
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
                itemCount: coffeeMenu.length,
                itemBuilder: (context, index) => SizedBox(
                  child: CoffeeTile(
                    coffee: coffeeMenu[index],
                    onTap: () => navigateToCoffeeDetails(index),
                  ),
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