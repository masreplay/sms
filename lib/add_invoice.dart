import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sms/cart_model.dart';
import 'package:sms/flex_padded.dart';
import 'package:sms/gen/assets.gen.dart';
import 'package:sms/hero.dart';

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
              child: Visibility(
                visible: cart.items.isNotEmpty,
                replacement: Center(
                  child: Assets.illustrations.noItems.image(width: 200),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                            builder: (_) => CartItemDialog(
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
              children: [
                const Text(
                  "المجموع الكلي",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${cart.getTotalPrice()}",
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
            )
          ],
        ),
      ),
    );
  }
}

class CartItemDialog extends StatelessWidget {
  const CartItemDialog({
    super.key,
    required this.item,
  });

  final CartItem item;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0xff303142),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton.filled(
                                onPressed: () {},
                                color: Colors.white,
                                icon: const Icon(Icons.delete_outlined),
                              ),
                              Hero(
                                tag: item.product.name,
                                flightShuttleBuilder: flightShuttleBuilder,
                                child: Text(item.product.name),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        color: Color(0xff363645),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chat_bubble_outline_rounded,
                        color: Color(0xff686772),
                        size: 48,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: Colors.black,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Color(0xff292937),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.0),
                  ),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff828791)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: RowPadded(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.inventory,
                            size: 18,
                            color: Color(0xff828791),
                          ),
                          Text(
                            "${item.count}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffD36441),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartListTile extends StatelessWidget {
  const CartListTile({
    super.key,
    required this.item,
    required this.onTap,
  });

  final CartItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Ink(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: const Color(0xff303142),
        ),
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: item.product.name,
                child: Text(item.product.name),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff828791)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: RowPadded(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.inventory,
                    size: 18,
                    color: Color(0xff828791),
                  ),
                  Text(
                    "${item.count}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffD36441),
                    ),
                  ),
                ],
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
      ),
    );
  }
}
