import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sms/product_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@riverpod
class GetCart extends _$GetCart {
  @override
  Cart build() => const Cart(items: []);

  void add(Product product) {
    state = state.copyWith(
      items: [
        ...state.items,
        CartItem(
          product: product,
        ),
      ],
    );
  }
}

@freezed
class Cart with _$Cart {
  const factory Cart({
    @Default([]) List<CartItem> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    int? newPrice,
    required Product product,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
