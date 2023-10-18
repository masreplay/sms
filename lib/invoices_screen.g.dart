// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_screen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      clientName: json['clientName'] as String,
      totalPrice: json['totalPrice'] as int,
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'clientName': instance.clientName,
      'totalPrice': instance.totalPrice,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getInvoicesHash() => r'7386b1d888acd7d5da8f577a94e8db87de0e165c';

/// See also [getInvoices].
@ProviderFor(getInvoices)
final getInvoicesProvider = AutoDisposeProvider<List<Invoice>>.internal(
  getInvoices,
  name: r'getInvoicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getInvoicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetInvoicesRef = AutoDisposeProviderRef<List<Invoice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
