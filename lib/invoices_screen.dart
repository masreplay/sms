import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sms/add_invoice.dart';
import 'package:sms/date_time.dart';
import 'package:sms/flex_padded.dart';
import 'package:sms/formatter.dart';
import 'package:sms/snack_bar.dart';

part 'invoices_screen.freezed.dart';
part 'invoices_screen.g.dart';

@freezed
class Invoice with _$Invoice {
  const Invoice._();
  const factory Invoice({
    required int id,
    required DateTime createdAt,
    required String clientName,
    required int totalPrice,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}

@riverpod
List<Invoice> getInvoices(GetInvoicesRef ref) {
  return [
    Invoice(
      id: 99999,
      createdAt: DateTime(2023, 8, 15, 7, 7),
      clientName: "مذخر الفرات",
      totalPrice: 1000,
    ),
    Invoice(
      id: 99999,
      createdAt: DateTime(2023, 8, 22, 9, 26),
      clientName: "فوائد الودائع الثابتة",
      totalPrice: 30000,
    ),
    Invoice(
      id: 99999,
      createdAt: DateTime(2023, 8, 22, 9, 31),
      clientName: "فوائد الودائع الثابتة",
      totalPrice: 4000,
    ),
    Invoice(
      id: 99999,
      createdAt: DateTime(2023, 8, 22, 9, 32),
      clientName: "فوائد الودائع الثابتة",
      totalPrice: 10000,
    ),
    Invoice(
      id: 99999,
      createdAt: DateTime(2023, 8, 22, 9, 33),
      clientName: "فوائد الودائع الثابتة",
      totalPrice: 200,
    ),
    Invoice(
      id: 99999,
      createdAt: DateTime(2023, 8, 22, 9, 34),
      clientName: "فوائد الودائع الثابتة",
      totalPrice: 0,
    ),
  ];
}

class InvoicesScreen extends HookConsumerWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invoices = ref.watch(getInvoicesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('مبيعاتي'),
        actions: [
          Center(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddInvoiceScreen(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xff292937),
                ),
                child: const Icon(Icons.file_open_outlined),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 4 / 5,
        ),
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final item = invoices[index];
          return InvoiceGridTile(
            item: item,
          );
        },
      ),
    );
  }
}

class InvoiceGridTile extends StatelessWidget {
  const InvoiceGridTile({
    super.key,
    required this.item,
  });

  final Invoice item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff232432),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
              bottom: Radius.circular(12),
            ),
          ),
          child: ColumnPadded(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xff30313F),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff212331),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const Text(
                    "غير مقيدة",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC6702A),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColumnPadded(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "اسم العميل",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5D5D6A),
                      ),
                    ),
                    Text(
                      item.clientName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD7D7E1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff232432),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: ColumnPadded(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnPadded(
                        mainAxisSize: MainAxisSize.min,
                        gap: 4,
                        children: [
                          IconButtonOutlined(
                            icon: Icons.receipt_long,
                            onTap: () {
                              showUnimplementedSnackBar(context);
                            },
                          ),
                          const Text(
                            "رقم الفاتورة",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D5D6A),
                            ),
                          ),
                          Text(
                            item.id.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD7D7E1),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 16,
                        width: 3,
                        color: const Color(0xFFC6702A),
                      ),
                      ColumnPadded(
                        gap: 4,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButtonOutlined(
                            icon: Icons.receipt_long,
                            onTap: () {
                              showUnimplementedSnackBar(context);
                            },
                          ),
                          const Text(
                            "مجموع الفاتورة",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D5D6A),
                            ),
                          ),
                          Text(
                            item.totalPrice.toString().threeDigitFormatter(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD7D7E1),
                            ),
                          ),
                          const Text(
                            "دينار عراقي",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D5D6A),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xff1F1E2C),
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.createdAt.formatTime(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5D5D6A),
                        ),
                      ),
                      Text(
                        item.createdAt.formatDate(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5D5D6A),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class IconButtonOutlined extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;

  const IconButtonOutlined({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1,
          ),
          borderRadius: borderRadius,
        ),
        child: Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    );
  }
}
