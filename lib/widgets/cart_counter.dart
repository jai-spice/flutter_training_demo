import 'package:demo/models/cart_item.dart';
import 'package:demo/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24,
      child: Stack(
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
          Align(
            alignment: const Alignment(1, -1.5),
            child: ClipOval(
              child: Container(
                height: 16,
                width: 16,
                color: Colors.red,
                child: Center(
                  child: StreamBuilder<List<CartItem>>(
                      stream: CartBloc().stream,
                      builder: (context, snapshot) {
                        return FittedBox(
                          child: Text(
                            snapshot.data?.length.toString() ?? '-',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
