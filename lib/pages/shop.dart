import 'package:demo/bloc/cart_bloc.dart';
import 'package:demo/bloc/shop_bloc.dart';
import 'package:demo/pages/cart.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/widgets/cart_counter.dart';
import 'package:demo/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  late final ShopBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ShopBloc(CartBloc());
    bloc.add(const ShopEvent.fetchProducts());
  }

  @override
  Widget build(BuildContext context) {
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
          child: BlocBuilder<ShopBloc, ShopState>(
            bloc: bloc,
            builder: (context, state) {
              final products = state.products;

              if (products == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return GridView.builder(
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
                              onPressed: () => bloc
                                  .add(ShopEvent.addToCart(products[index])),
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
                  });
            },
          ),
        ),
      ]),
    );
  }
}
