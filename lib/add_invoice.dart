import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms/cart_model.dart';

import 'drop_down.dart';
import 'product_model.dart';

class AddInvoiceScreen extends HookConsumerWidget {
  const AddInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(getCartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('فاتورة بيع: فوائد الودائع الثابتة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownFormField(
              items: products,
              itemTextBuilder: (product) => product.name,
              onChanged: (product) {
                ref.read(getCartProvider.notifier).add(product);
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return CartListTile(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartListTile extends StatelessWidget {
  const CartListTile({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xff303142),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(item.product.name),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff828791)),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${item.product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: " د.ع",
                  style: TextStyle(
                    color: Color(0xff828791),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
