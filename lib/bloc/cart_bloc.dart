import 'dart:async';

import 'package:demo/models/cart_item.dart';
import 'package:rxdart/rxdart.dart';

/// This is a singleton class, which means that only one instance of this class can be created.
/// This is done to ensure that the same instance of the class is used throughout the app.
class CartBloc {
  CartBloc._();
  static CartBloc? _instance;
  factory CartBloc() {
    _instance ??= CartBloc._();
    return _instance!;
  }

  /// This is a BehaviorSubject, which means that it has a default value and it also has a stream.
  /// The stream can be listened to and the default value can be accessed.
  /// The default value is an empty list.
  /// The stream is a broadcast stream, which means that it can be listened to by multiple listeners.
  /// The stream is also a hot stream, which means that it will not emit the default value when a new listener is added.
  final BehaviorSubject<List<CartItem>> _controller =
      BehaviorSubject.seeded([]);

  /// This is a getter method for the stream.
  ValueStream<List<CartItem>> get stream => _controller.stream;

  /// This method is used to add a single item to the cart.
  Future<void> addCartItem(CartItem item) async {
    _controller.add([...stream.value, item]);
  }

  /// This method is used to add multiple items to the cart.
  Future<void> addCartItems(List<CartItem> items) async {
    _controller.add([...stream.value, ...items]);
  }
}
