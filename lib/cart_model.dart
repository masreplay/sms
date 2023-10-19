import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sms/product_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@riverpod
class GetCart extends _$GetCart {
  @override
  Cart build() => const Cart(
        clientName: 'فوائد الودائع الثابتة',
      );

  void add(Product product) {
    final index =
        state.items.indexWhere((element) => element.product == product);
    if (index == -1) {
      state = state.copyWith(
        items: [
          ...state.items,
          CartItem(product: product),
        ],
      );
    } else {
      final items = [...state.items];
      items[index] = items[index].copyWith(count: items[index].count + 1);
      state = state.copyWith(items: items);
    }
  }

  void remove(Product product) {
    final index =
        state.items.indexWhere((element) => element.product == product);
    if (index == -1) {
      return;
    } else {
      final items = [...state.items];
      if (items[index].count == 1) {
        items.removeAt(index);
      } else {
        items[index] = items[index].copyWith(count: items[index].count - 1);
      }
      state = state.copyWith(items: items);
    }
  }

  void delete(CartItem item) {
    final items = [...state.items];
    items.remove(item);
    state = state.copyWith(items: items);
  }

  void updatePrice(CartItem item, String value) {
    final items = [...state.items];
    final index = items.indexWhere((element) => element == item);
    if (index == -1) {
      return;
    } else {
      items[index] = items[index].copyWith(newPrice: int.tryParse(value));
      state = state.copyWith(items: items);
    }
  }

  void update(Cart cart) => state = cart;
}

@freezed
class Cart with _$Cart {
  const Cart._();

  const factory Cart({
    required String clientName,
    int? total,
    int? discount,
    int? priceAfterDiscount,
    int? paid,
    int? remaining,
    @Default([]) List<CartItem> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  int getTotalPrice() {
    int totalPrice = 0;

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
