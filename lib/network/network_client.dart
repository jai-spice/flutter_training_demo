import 'package:demo/models/cart_item.dart';

class NetworkClient {
  static final NetworkClient _instance = NetworkClient._internal();
  NetworkClient._internal();
  factory NetworkClient() => _instance;

  Future<List<CartItem>> getCartItems() async {
    await Future.delayed(const Duration(seconds: 3));
    return const [
      CartItem(
        name: 'Apple Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$8.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Pineapple Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$9.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Carrot Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$5.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Pomegranate Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$12.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Apple Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$8.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Pineapple Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$9.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Carrot Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$5.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Pomegranate Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$12.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Apple Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$8.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Pineapple Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$9.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Carrot Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$5.65',
        quantity: 1,
      ),
      CartItem(
        name: 'Pomegranate Juice',
        description: 'Lorem ipsum dolor sit emet',
        price: '\$12.65',
        quantity: 1,
      ),
    ];
  }
}
