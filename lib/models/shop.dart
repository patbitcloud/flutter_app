import 'package:flutter/material.dart';
import 'coffee.dart';

class Shop extends ChangeNotifier{

  // coffee menu
  final List<Coffee> _coffeeMenu = [
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

  // customer cart
  List<Coffee> _cart = [

  ];

  // customer cart
  List<Coffee> get coffeeMenu => _coffeeMenu;
  List<Coffee> get cart => _cart;

  // add to cart
  void addToCart(Coffee coffeeItem, int quatity) {
    for (int i=0; i<quatity; i++) {
      _cart.add(coffeeItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Coffee coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }
}