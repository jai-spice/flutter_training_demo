import 'package:demo/models/cart_item.dart';
import 'package:demo/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class AddCartItemButton extends StatelessWidget {
  const AddCartItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final provider = CartProvider();
        provider.addCartItem(
          const CartItem(
            name: 'Some Juice',
            description: 'Some Description',
            price: '\$6.00',
            quantity: 1,
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
