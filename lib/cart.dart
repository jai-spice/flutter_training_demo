import 'package:demo/cart_items.dart';
import 'package:flutter/material.dart';

import 'my_appbar.dart';
import 'pay_button.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Stack(children: [
        const MyAppBar(),
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
