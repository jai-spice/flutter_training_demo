import 'package:demo/constants.dart';
import 'package:flutter/material.dart';

class CartItemListWidget extends StatelessWidget {
  const CartItemListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const cartItems = [
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

    return Container(
      margin: const EdgeInsets.only(top: kMyAppBarHeight),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return CartItemWidget(item: cartItems[index]);
        },
        itemCount: cartItems.length,
      ),
    );
  }
}

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
