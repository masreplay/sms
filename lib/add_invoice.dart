import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sms/cart_item_details_dialog.dart';
import 'package:sms/cart_list_tile.dart';
import 'package:sms/cart_model.dart';
import 'package:sms/flex_padded.dart';
import 'package:sms/formatter.dart';
import 'package:sms/gen/assets.gen.dart';
import 'package:sms/hero.dart';
import 'package:sms/invoice_details_dialog.dart';
import 'package:sms/outlined_vertical_button.dart';
import 'package:sms/snack_bar.dart';

import 'drop_down.dart';
import 'product_model.dart';

part 'add_invoice.g.dart';

@riverpod
List<Product> getProduct(GetProductRef ref) {
  return [
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
}

class AddInvoiceScreen extends HookConsumerWidget {
  const AddInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(getCartProvider);
    final products = ref.watch(getProductProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('فاتورة بيع: ${cart.clientName}'),
        leading: InkResponse(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff8A8791),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.keyboard_arrow_right_rounded),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: ColumnPadded(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          gap: 8,
          children: [
            Container(
              color: Theme.of(context).colorScheme.background,
              child: DropdownFormField(
                items: products,
                itemTextBuilder: (product) => product.name,
                onChanged: (product) {
                  ref.read(getCartProvider.notifier).add(product);
                },
              ),
            ),
            Expanded(
              child: Visibility(
                visible: cart.items.isNotEmpty,
                replacement: Center(
                  child: Assets.illustrations.noItems.image(width: 200),
                ),
                child: ListView.separated(
                  itemCount: cart.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return CartListTile(
                      item: item,
                      onTap: () {
                        Navigator.push(
                          context,
                          HeroDialogRoute(
                            builder: (_) => CartItemDetailsDialog(
                              item: item,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "المجموع الكلي",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${cart.getTotalPrice()}".threeDigitFormatter(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: " د.ع ",
                        style: TextStyle(
                          color: Color(0xff828791),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RowPadded(
              children: [
                Expanded(
                  child: OutlinedVerticalButton(
                    text: "باركود",
                    icon: Icons.qr_code_scanner_rounded,
                    onTap: () => showUnimplementedSnackBar(context),
                    iconColor: const Color(0xffD36441),
                  ),
                ),
                Expanded(
                  child: OutlinedVerticalButton(
                    text: "معاينة وارسال",
                    icon: Icons.file_copy,
                    onTap: cart.items.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              HeroDialogRoute(
                                builder: (context) {
                                  return const InvoiceDetailsDialog();
                                },
                              ),
                            );
                          },
                    backgroundColor: const Color(0xff21956E),
                  ),
                ),
                Expanded(
                  child: OutlinedVerticalButton(
                    text: "حفظ كمسودة",
                    icon: Icons.save_rounded,
                    onTap: cart.items.isEmpty
                        ? null
                        : () => showUnimplementedSnackBar(context),
                  ),
                ),
              ],
            ),
            OutlinedButton.icon(
              icon: const Icon(
                Icons.file_copy,
                color: Color(0xFF8C224E),
              ),
              label: const Text(
                "الغاء الفاتورة",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: cart.items.isEmpty
                  ? null
                  : () => showUnimplementedSnackBar(context),
            ),
          ],
        ),
      ),
    );
  }
}
