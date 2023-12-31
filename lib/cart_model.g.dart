// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      clientName: json['clientName'] as String,
      total: json['total'] as int?,
      discount: json['discount'] as int?,
      priceAfterDiscount: json['priceAfterDiscount'] as int?,
      paid: json['paid'] as int?,
      remaining: json['remaining'] as int?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'clientName': instance.clientName,
      'total': instance.total,
      'discount': instance.discount,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'paid': instance.paid,
      'remaining': instance.remaining,
      'items': instance.items,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 1,
      newPrice: json['newPrice'] as int?,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'count': instance.count,
      'newPrice': instance.newPrice,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCartHash() => r'ff66cce7779ed92418ea885e368b3e5abbb6be0a';

/// See also [GetCart].
@ProviderFor(GetCart)
final getCartProvider = AutoDisposeNotifierProvider<GetCart, Cart>.internal(
  GetCart.new,
  name: r'getCartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetCart = AutoDisposeNotifier<Cart>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
