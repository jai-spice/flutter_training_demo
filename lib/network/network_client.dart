import 'dart:convert';

import 'package:demo/models/cart_item.dart';
import 'package:flutter/services.dart';

class NetworkClient {
  static final NetworkClient _instance = NetworkClient._internal();
  NetworkClient._internal();
  factory NetworkClient() => _instance;

  Future<List<CartItem>> getCartItems() async {
    try {
      final String jsonString = await rootBundle
          .loadString('assets/items.json'); // Getting data from API
      final List itemList = jsonDecode(jsonString)
          as List; // jsonDecode gives a dynamic output, it is upto us to determine whether it is a list or a single object.
      return itemList.map((json) => CartItem.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
