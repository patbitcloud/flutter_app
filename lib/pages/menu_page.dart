import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Color.fromARGB(255, 0, 102, 71),
        ),
        title: Text(
          'Menu',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 102, 71),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // promo banner

          // search bar

          // menu items

          // popular items
        ],
      ),
    );
  }
}