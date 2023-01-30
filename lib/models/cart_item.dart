class CartItem {
  final String name;
  final String description;
  final String price;
  final int quantity;

  const CartItem({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return 'CartItem{name: $name, description: $description, price: $price, quantity: $quantity}';
  }
}
