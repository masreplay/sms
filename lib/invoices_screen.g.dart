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

String _$getInvoicesHash() => r'3309406958d8363d4a5b9525a1064bc4faa6012f';

/// See also [GetInvoices].
@ProviderFor(GetInvoices)
final getInvoicesProvider =
    AutoDisposeNotifierProvider<GetInvoices, List<Invoice>>.internal(
  GetInvoices.new,
  name: r'getInvoicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getInvoicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GetInvoices = AutoDisposeNotifier<List<Invoice>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
