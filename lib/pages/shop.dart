import 'package:demo/bloc/cart_bloc.dart';
import 'package:demo/models/cart_item.dart';
import 'package:demo/models/product.dart';
import 'package:demo/pages/cart.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/widgets/cart_counter.dart';
import 'package:demo/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    const products = [
      Product(
        id: "1",
        img: "",
        price: 20,
        title: "Apple Juice",
        description: 'Some Description',
      ),
      Product(
        id: "2",
        img: "",
        price: 26,
        title: "Pomegranate Juice",
        description: 'Some Description',
      ),
      Product(
        id: "3",
        img: "",
        price: 18,
        title: "Orange Juice",
        description: 'Some Description',
      ),
      Product(
        id: "4",
        img: "",
        price: 22,
        title: "Grape Juice",
        description: 'Some Description',
      ),
      Product(
        id: "5",
        img: "",
        price: 24,
        title: "Mango Juice",
        description: 'Some Description',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Stack(children: [
        MyAppBar(
          title: 'My Shop',
          trailing: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              child: const CartCounter()),
        ),
        Container(
          margin: const EdgeInsets.only(top: kMyAppBarHeight),
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[600],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 160,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          products[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${products[index].price}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            final bloc = CartBloc();
                            bloc.addCartItem(CartItem(
                              name: products[index].title,
                              description: products[index].description,
                              price: "\$${products[index].price}",
                              quantity: 1,
                            ));
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 12, 27, 34),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ));
              }),
        ),
      ]),
    );
  }
}
