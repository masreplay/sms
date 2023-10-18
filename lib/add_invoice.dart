import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sms/cart_model.dart';
import 'package:sms/flex_padded.dart';
import 'package:sms/formatter.dart';
import 'package:sms/gen/assets.gen.dart';
import 'package:sms/hero.dart';
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
        title: const Text('فاتورة بيع: فوائد الودائع الثابتة'),
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
                        text: "${cart.getTotalPrice()}",
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
                    onTap: cart.items.isEmpty ? null : () {},
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

class OutlinedVerticalButton extends StatelessWidget {
  const OutlinedVerticalButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  // style
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);

    final enabled = onTap != null;

    final textColor = this.textColor ?? Theme.of(context).colorScheme.onSurface;
    final iconColor = this.iconColor ?? Theme.of(context).colorScheme.onSurface;

    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: enabled ? backgroundColor : backgroundColor?.withOpacity(0.5),
          border: Border.all(color: const Color(0xff35313F)),
        ),
        child: ColumnPadded(
          children: [
            Icon(
              icon,
              color: enabled ? iconColor : iconColor.withOpacity(0.5),
            ),
            Text(
              text,
              style: TextStyle(
                color: enabled ? textColor : textColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemDialog extends HookConsumerWidget {
  const CartItemDialog({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(getCartProvider).items.firstWhere(
          (element) => element.product == this.item.product,
          orElse: () => this.item,
        );

    final controller = useTextEditingController(text: "${item.newPrice ?? 0}");

    final isEditing = useState(false);

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  ref
                                      .read(getCartProvider.notifier)
                                      .delete(item);
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0xff8A8791),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.delete_outlined),
                                ),
                              ),
                              Hero(
                                tag: item.product.name,
                                flightShuttleBuilder: flightShuttleBuilder,
                                child: Text(
                                  item.product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: isEditing.value,
                            replacement: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff254958),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: RowPadded(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IntrinsicWidth(
                                    child: TextField(
                                      controller: controller,
                                      onChanged: (value) {
                                        ref
                                            .read(getCartProvider.notifier)
                                            .updatePrice(item, value);
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration:
                                          const InputDecoration.collapsed(
                                        hintText: "السعر",
                                        fillColor: Color(0xff1F5E68),
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: controller,
                                    builder: (context, value, child) {
                                      return Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: controller.text
                                                  .threeDigitFormatter(),
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
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                isEditing.value = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff503042),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: RowPadded(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD9263E),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: RowPadded(
                                        gap: 2,
                                        children: const [
                                          Text(
                                            "مخصص",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_left,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ValueListenableBuilder(
                                        valueListenable: controller,
                                        builder: (context, value, child) {
                                          return Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: controller.text
                                                      .threeDigitFormatter(),
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
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                const TextSpan(
                                  text: "المجموع",
                                  style: TextStyle(color: Color(0xff525361)),
                                ),
                                // space
                                const TextSpan(text: " "),
                                TextSpan(
                                  text: item.newPrice == null
                                      ? "0"
                                      : "${item.newPrice! * item.count}"
                                          .threeDigitFormatter(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const TextSpan(text: " "),
                                const TextSpan(
                                  text: "د.ع",
                                  style: TextStyle(color: Color(0xff525361)),
                                ),
                              ],
                            ),
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
                child: RowPadded(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: RowPadded(
                        children: [
                          InkWell(
                            onTap: () {
                              ref
                                  .watch(getCartProvider.notifier)
                                  .add(item.product);

                              isEditing.value = true;
                            },
                            child: const Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            item.count.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (item.count > 1) {
                                ref
                                    .watch(getCartProvider.notifier)
                                    .remove(item.product);
                              }
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff1A1925),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: RowPadded(
                        children: const [
                          Text(
                            "هدية",
                            style: TextStyle(
                              color: Color(0xff26A77D),
                            ),
                          ),
                          Icon(
                            Icons.add_box_rounded,
                            size: 18,
                            color: Color(0xff26A77D),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff828791)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 6.0,
                      ),
                      child: RowPadded(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.inventory,
                            size: 18,
                            color: Color(0xff828791),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff828791),
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
      child: Container(
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
                children: const [
                  Icon(
                    Icons.inventory,
                    size: 18,
                    color: Color(0xff828791),
                  ),
                  Text(
                    "1",
                    style: TextStyle(
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
