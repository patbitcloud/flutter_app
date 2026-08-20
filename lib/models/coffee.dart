class Coffee {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String rating;

  Coffee({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.rating,
  });

   String get formattedPrice => '\$${price.toStringAsFixed(2)}';
   String get formattedRating => '$rating ⭐';
   String get formattedName => name.length > 20 ? '${name.substring(0, 20)}...' : name;
   String get formattedImagePath => imagePath.isNotEmpty ? imagePath : 'lib/images/default_coffee.png';
}