import 'package:demo/models/cart_item.dart';
import 'package:demo/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PayButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.pink[200],
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<List<CartItem>>(
                  stream: CartBloc().stream,
                  builder: (context, snapshot) {
                    final String value;

                    if (snapshot.data == null) {
                      value = '-';
                    } else {
                      value =
                          snapshot.data!.fold(0.0, (previousValue, element) {
                        return previousValue +
                            double.parse(element.price.replaceFirst('\$', ''));
                      }).toStringAsFixed(2);
                    }

                    return Text(
                      "\$$value",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  }),
              const Text(
                'PAY',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
