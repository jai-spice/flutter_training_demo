import 'package:demo/widgets/cart_items.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_counter.dart';
import '../widgets/my_appbar.dart';
import '../widgets/pay_button.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(children: [
        const MyAppBar(
          title: 'My Cart',
          trailing: CartCounter(),
        ),
        const CartItemListWidget(),
        Align(
          alignment: Alignment.bottomCenter,
          child: PayButton(
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
