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

String _$getInvoicesHash() => r'e18d915d645b6c3dfcf8c59e21b42471966c3402';

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
