part of 'shop_bloc.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState({required List<Product>? products}) = _ShopState;
}
