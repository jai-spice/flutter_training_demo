part of 'shop_bloc.dart';

@freezed
class ShopEvent with _$ShopEvent {
  const factory ShopEvent.fetchProducts() = _FetchProductsEvent;
  const factory ShopEvent.addToCart(Product product) = _AddToCartEvent;
}
