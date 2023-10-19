import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms/cart_model.dart';
import 'package:sms/flex_padded.dart';
import 'package:sms/formatter.dart';
import 'package:sms/hero.dart';

class CartItemDetailsDialog extends HookConsumerWidget {
  const CartItemDetailsDialog({
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
