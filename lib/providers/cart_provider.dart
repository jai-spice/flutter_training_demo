import 'dart:async';

import 'package:demo/models/cart_item.dart';

class CartProvider {
  List<CartItem>? value; // current value holder
  CartProvider._() {
    value = [];
    _controller.add([]);
  }
  static CartProvider? _instance;
  factory CartProvider() {
    _instance ??= CartProvider._();
    return _instance!;
  }

  final StreamController<List<CartItem>> _controller =
      StreamController.broadcast();

  Stream<List<CartItem>> get stream => _controller.stream;

  Future<void> addCartItem(CartItem item) async {
    value = [...value!, item];
    _controller.add(value!);
  }

  Future<void> addCartItems(List<CartItem> items) async {
    value = [...value!, ...items];
    _controller.add(value!);
  }
}
