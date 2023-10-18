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
  const Cart._();

  const factory Cart({
    @Default([]) List<CartItem> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  double getTotalPrice() {
    double totalPrice = 0;

    for (var item in items) {
      if (item.newPrice != null) {
        totalPrice += item.newPrice! * item.count;
      } else {
        totalPrice += item.product.price * item.count;
      }
    }
    return totalPrice;
  }
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    @Default(1) int count,
    int? newPrice,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
