import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo/bloc/cart_bloc.dart';
import 'package:demo/models/cart_item.dart';
import 'package:demo/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_event.dart';
part 'shop_state.dart';

part 'shop_bloc.freezed.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc(this.bloc) : super(const ShopState(products: null)) {
    // Event Handlers
    on<_FetchProductsEvent>(_onFetchProductsHandler);
    on<_AddToCartEvent>(_onAddToCartHandler);
  }

  final CartBloc bloc;

  FutureOr<void> _onFetchProductsHandler(
      _FetchProductsEvent event, Emitter<ShopState> emit) async {
    emit(const ShopState(products: null));
    await Future.delayed(const Duration(milliseconds: 1500));
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
    emit(const ShopState(products: products));
  }

  FutureOr<void> _onAddToCartHandler(
      _AddToCartEvent event, Emitter<ShopState> emit) {
    bloc.addCartItem(CartItem(
      name: event.product.title,
      description: event.product.description,
      price: "\$${event.product.price}",
      quantity: 1,
    ));
  }
}
