// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String get clientName => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  int? get priceAfterDiscount => throw _privateConstructorUsedError;
  int? get paid => throw _privateConstructorUsedError;
  int? get remaining => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {String clientName,
      int? total,
      int? discount,
      int? priceAfterDiscount,
      int? paid,
      int? remaining,
      List<CartItem> items});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientName = null,
    Object? total = freezed,
    Object? discount = freezed,
    Object? priceAfterDiscount = freezed,
    Object? paid = freezed,
    Object? remaining = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      priceAfterDiscount: freezed == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientName,
      int? total,
      int? discount,
      int? priceAfterDiscount,
      int? paid,
      int? remaining,
      List<CartItem> items});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientName = null,
    Object? total = freezed,
    Object? discount = freezed,
    Object? priceAfterDiscount = freezed,
    Object? paid = freezed,
    Object? remaining = freezed,
    Object? items = null,
  }) {
    return _then(_$CartImpl(
      clientName: null == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      priceAfterDiscount: freezed == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      remaining: freezed == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
              as int?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl extends _Cart {
  const _$CartImpl(
      {required this.clientName,
      this.total,
      this.discount,
      this.priceAfterDiscount,
      this.paid,
      this.remaining,
      final List<CartItem> items = const []})
      : _items = items,
        super._();

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final String clientName;
  @override
  final int? total;
  @override
  final int? discount;
  @override
  final int? priceAfterDiscount;
  @override
  final int? paid;
  @override
  final int? remaining;
  final List<CartItem> _items;
  @override
  @JsonKey()
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'Cart(clientName: $clientName, total: $total, discount: $discount, priceAfterDiscount: $priceAfterDiscount, paid: $paid, remaining: $remaining, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.priceAfterDiscount, priceAfterDiscount) ||
                other.priceAfterDiscount == priceAfterDiscount) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientName,
      total,
      discount,
      priceAfterDiscount,
      paid,
      remaining,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart extends Cart {
  const factory _Cart(
      {required final String clientName,
      final int? total,
      final int? discount,
      final int? priceAfterDiscount,
      final int? paid,
      final int? remaining,
      final List<CartItem> items}) = _$CartImpl;
  const _Cart._() : super._();

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  String get clientName;
  @override
  int? get total;
  @override
  int? get discount;
  @override
  int? get priceAfterDiscount;
  @override
  int? get paid;
  @override
  int? get remaining;
  @override
  List<CartItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  Product get product => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int? get newPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({Product product, int count, int? newPrice});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? count = null,
    Object? newPrice = freezed,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      newPrice: freezed == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, int count, int? newPrice});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? count = null,
    Object? newPrice = freezed,
  }) {
    return _then(_$CartItemImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      newPrice: freezed == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl({required this.product, this.count = 1, this.newPrice});

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final Product product;
  @override
  @JsonKey()
  final int count;
  @override
  final int? newPrice;

  @override
  String toString() {
    return 'CartItem(product: $product, count: $count, newPrice: $newPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.newPrice, newPrice) ||
                other.newPrice == newPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, count, newPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {required final Product product,
      final int count,
      final int? newPrice}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  Product get product;
  @override
  int get count;
  @override
  int? get newPrice;
  @override
  @JsonKey(ignore: true)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
