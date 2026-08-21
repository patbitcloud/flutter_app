import 'package:flutter/material.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/models/coffee.dart';
import 'package:flutter_app/models/shop.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart (Coffee coffee, BuildContext context) {
    // get acccess to shop
    final shop = context.read<Shop>();

    // remove from cart
    shop.removeFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: secondaryColor,
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            bool isSuccess = true;
            Navigator.of(context).pop(isSuccess);
          }, 
          icon: const Icon(Icons.arrow_back, color: Colors.white)),
          title: Text(
            "My Cart",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          elevation: 0,
          backgroundColor: secondaryColor,
        ),
        body: Column(
          children: [
            // Customer Cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Coffee coffee = value.cart[index];
              
                  // get food name
                  final String coffeeName = coffee.name;
              
                  // get food price 
                  final double coffeePrice = coffee.price;
              
                  
                  // return list tile
                  return Container(
                    decoration: BoxDecoration(
                      color: primaryColor, 
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        coffeeName, 
                        style: const TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text(
                        '\$${coffeePrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeFromCart(coffee, context), 
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Pay Button
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(
                text: "Pay Now",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}