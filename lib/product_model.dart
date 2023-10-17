import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    @Default(0) int price,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

final products = [
  const Product(name: "تست"),
  const Product(name: "Hat"),
  const Product(name: "Blue shirt"),
  const Product(name: "Package quantity test"),
  const Product(name: "test2", price: 2),
  const Product(name: "test5"),
  const Product(
    name:
        "asdadadsa asdad a d asd a sdawdawd aLorem ipsum dolor sit amet, consectetur adipiscing elit. Done quis sapien mi. Phasellus sed ante molestie, maximus lacus at, sagittis metus e molestie, maximus lacus at, sagittis metus",
  ),
];
