import 'package:flutter/material.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/pages/coffee_details_page.dart';
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

  List coffeeMenu = [
    Coffee (
      name: 'Latte Macchiato',
      description: 'The Latte Macchiato is a layered masterpiece, designed to highlight the delicate balance between espresso and milk. At its core lies a bold shot of espresso, poured gently over steamed milk to create a striking contrast in both flavor and appearance. The name “macchiato” means “stained” in Italian, referring to the way the espresso marks the milk with its rich, dark hue. Visually, it’s a treat — the layers of milk, espresso, and foam create a gradient that’s as beautiful as it is appetizing. This presentation makes it a favorite among coffee enthusiasts who appreciate artistry in their cup. The silky foam on top adds a luxurious texture, inviting you to savor each sip slowly.',
      price: 4.99, 
      imagePath: 'lib/images/latte_macchiato.png', 
      rating: '4.5'
    ),
    Coffee (
      name: 'Cappuccino',
      description: 'The Cappuccino is a timeless classic, beloved for its perfect harmony of espresso, steamed milk, and frothy foam. Originating in Italy, it has become a staple in cafés worldwide, cherished for its bold yet balanced flavor profile. Its hallmark is the thick, velvety foam that crowns the drink. This foam not only adds texture but also acts as an insulator, keeping the coffee warm while offering a creamy mouthfeel. Often dusted with cocoa powder or cinnamon, it provides a subtle sweetness that complements the robust espresso beneath.',
      price: 3.99, 
      imagePath: 'lib/images/cappuccino.png', 
      rating: '4.0'
    ),
    Coffee (
      name: 'Espresso',
      description: 'Espresso is the essence of coffee distilled into its purest form. Brewed under high pressure, it produces a small but powerful shot that captures the full intensity of the beans. With its rich crema on top, espresso is both visually striking and deeply satisfying. The flavor is bold, concentrated, and complex. Notes of chocolate, caramel, or even fruit can emerge depending on the beans used. It’s a drink that demands attention, offering a sensory experience that lingers long after the last sip.',
      price: 2.99, 
      imagePath: 'lib/images/espresso.png', 
      rating: '4.2'
    ),
    Coffee (
      name: 'Iced Coffee',
      description: 'Iced Coffee is the refreshing counterpart to traditional hot brews, offering a crisp and invigorating experience. Brewed strong and served over ice, it delivers the familiar taste of coffee with a cooling twist. The flavor is smooth yet bold, often enhanced with milk or sweeteners to create a balanced profile. The chill of the ice tempers the bitterness, making it a popular choice for those who enjoy coffee but prefer a lighter, more refreshing version.', 
      price: 5.49, 
      imagePath: 'lib/images/iced_coffee.png', 
      rating: '4.3'
    ),
    Coffee (
      name: 'Black Coffee',
      description: 'Black Coffee is the purest expression of the bean, unadorned and uncompromising. Brewed without milk or sugar, it delivers a bold, robust flavor that highlights the natural characteristics of the roast. The taste is strong and straightforward, often with earthy, nutty, or smoky notes. It’s a drink that appeals to those who appreciate authenticity and simplicity, offering a direct connection to the essence of coffee.',
      price: 4.49, 
      imagePath: 'lib/images/black_coffee.png', 
      rating: '4.1'
    ),
    Coffee (
      name: 'Caramel Whipped Coffee',
      description: 'Caramel Whipped Coffee is indulgence in a cup, combining the richness of coffee with the sweetness of caramel and the luxury of whipped cream. It’s a dessert-like experience that satisfies both caffeine cravings and a sweet tooth. The flavor is decadent, with the caramel adding a buttery sweetness that complements the coffee’s bitterness. The whipped cream provides a creamy texture, making each sip feel like a treat. It’s a drink that blurs the line between beverage and dessert.',
      price: 5.99, 
      imagePath: 'lib/images/caramel_whipped_coffee.png', 
      rating: '4.4'
    ),
  ];

  // Navigate to coffee item details page
  void navigateToCoffeeDetails(int index){
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: secondaryColor,
        ),
        title: Text(
          'Menu',
          style: TextStyle(
            color: secondaryColor,
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