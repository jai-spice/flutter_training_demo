import 'package:demo/widgets/add_cart_item_button.dart';
import 'package:demo/widgets/cart_items.dart';
import 'package:flutter/material.dart';

import '../widgets/my_appbar.dart';
import '../widgets/pay_button.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      floatingActionButton: const AddCartItemButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
