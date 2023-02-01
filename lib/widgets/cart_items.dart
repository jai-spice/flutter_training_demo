import 'package:demo/network/network_client.dart';
import 'package:demo/providers/cart_provider.dart';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CartItemListWidget extends StatefulWidget {
  const CartItemListWidget({super.key});

  @override
  State<CartItemListWidget> createState() => _CartItemListWidgetState();
}

class _CartItemListWidgetState extends State<CartItemListWidget> {
  final CartProvider cartProvider = CartProvider();

  @override
  void initState() {
    super.initState();
    getCartItems();
  }

  Future<void> getCartItems() async {
    final items = await NetworkClient().getCartItems();
    cartProvider.addCartItems(items);
  }

  Widget buildCartList(List<CartItem> cartItems) {
    if (cartItems.isEmpty) {
      return const Center(
        child: Text(
          'No Data Found',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return CartItemWidget(item: cartItems[index]);
      },
      itemCount: cartItems.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kMyAppBarHeight),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: StreamBuilder(
        stream: cartProvider.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          return buildCartList(snapshot.data!);
        },
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      child: Row(
        children: [
          Container(
            height: 160,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.description,
                  style: const TextStyle(color: Colors.white30, fontSize: 10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${item.quantity}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
