import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms/cart_list_tile.dart';
import 'package:sms/cart_model.dart';
import 'package:sms/flex_padded.dart';
import 'package:sms/invoices_screen.dart';

class InvoiceDetailsDialog extends HookConsumerWidget {
  const InvoiceDetailsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Cart cart = ref.watch(getCartProvider);

    final totalController = useTextEditingController(
      text: "${cart.getTotalPrice()}",
    );
    final discountController = useTextEditingController(text: "0");
    final priceAfterDiscountController = useTextEditingController(text: "0");
    final paidController = useTextEditingController(text: "0");
    final remainingController = useTextEditingController(text: "0");

    const divider = Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: DottedLine(
        dashColor: Color(0xff5D5D6A),
        lineThickness: 1,
        dashGapLength: 20,
        dashLength: 20,
      ),
    );

    const large = Radius.circular(24);
    const small = Radius.circular(12);
    const background = Color(0xff232432);
    const surface = Color(0xff30313F);
    const padding = EdgeInsets.all(16.0);

    return Container(
      padding: const EdgeInsets.all(24.0),
      alignment: Alignment.center,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.vertical(
                    top: large,
                    bottom: small,
                  ),
                ),
                child: ColumnPadded(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: surface,
                        borderRadius: BorderRadius.vertical(top: large),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xff8A8791),
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                            ),
                            onPressed: Navigator.of(context).pop,
                            child: const Icon(Icons.close),
                          ),
                          Container(
                            width: 150,
                            height: 18,
                            decoration: const BoxDecoration(
                              color: background,
                              borderRadius: BorderRadius.all(small),
                            ),
                          ),
                          const SizedBox(width: 48)
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(48.0),
                      alignment: Alignment.center,
                      child: Text(
                        cart.clientName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD7D7E1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              divider,
              Container(
                padding: padding,
                decoration: const BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.all(small),
                ),
                child: ColumnPadded(
                  children: [
                    _buildTextEditingFormField(
                      readOnly: true,
                      labelText: "مجموع الفاتورة:",
                      controller: totalController,
                    ),
                    _buildTextEditingFormField(
                      readOnly: false,
                      labelText: "خصم:",
                      controller: discountController,
                      onChanged: (value) {
                        final discount = int.parse(value);
                        final total = cart.getTotalPrice();
                        final priceAfterDiscount = total - discount;

                        priceAfterDiscountController.text =
                            "$priceAfterDiscount";
                        paidController.text = "$priceAfterDiscount";
                      },
                    ),
                    _buildTextEditingFormField(
                      readOnly: true,
                      labelText: "المجموع بعد الخصم:",
                      controller: priceAfterDiscountController,
                    ),
                    _buildTextEditingFormField(
                      readOnly: false,
                      labelText: "الواصل:",
                      controller: paidController,
                      onChanged: (value) {
                        final paid = int.parse(value);
                        final priceAfterDiscount = int.parse(
                          priceAfterDiscountController.text,
                        );
                        final remaining = priceAfterDiscount - paid;

                        remainingController.text = "$remaining";
                      },
                    ),
                    _buildTextEditingFormField(
                      readOnly: true,
                      labelText: "الباقي:",
                      controller: remainingController,
                    ),
                  ],
                ),
              ),
              divider,
              Container(
                padding: padding,
                decoration: const BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.vertical(
                    top: small,
                    bottom: large,
                  ),
                ),
                child: Column(
                  children: List.generate(
                    cart.items.length,
                    (index) {
                      return InvoiceItemListTile(
                        item: cart.items[index],
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: FilledButton.icon(
                  onPressed: () async {
                    ref.read(getCartProvider.notifier).update(
                          cart.copyWith(
                            total: int.parse(totalController.text),
                            discount: int.parse(discountController.text),
                            priceAfterDiscount:
                                int.parse(priceAfterDiscountController.text),
                            paid: int.parse(paidController.text),
                            remaining: int.parse(remainingController.text),
                          ),
                        );

                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(
                                color: Colors.red,
                              ),
                              Text("يرجى الانتظار"),
                            ],
                          ),
                        );
                      },
                    );
                    await Future.delayed(const Duration(seconds: 2));
                    ref.read(getInvoicesProvider.notifier).add(cart);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("تم ارسال الفاتورة بنجاح"),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xffD9263E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  icon: const Icon(Icons.file_open),
                  label: const Text("ارسال"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextEditingFormField({
    required String labelText,
    required bool readOnly,
    required TextEditingController controller,
    ValueChanged<String>? onChanged,
  }) {
    return RowPadded(
      gap: 24,
      children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff727483),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: TextField(
            style: TextStyle(
              color: readOnly ? const Color(0xffF07914) : Colors.white,
            ),
            controller: controller,
            readOnly: readOnly,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                child: const Text(
                  "د.ع",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff727483),
                  ),
                ),
              ),
              contentPadding: const EdgeInsets.all(4.0),
              fillColor: const Color(0xff373846),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InvoiceItemListTile extends StatelessWidget {
  const InvoiceItemListTile({
    super.key,
    required this.item,
  });

  final CartItem item;
  @override
  Widget build(BuildContext context) {
    const large = Radius.circular(24);
    const small = Radius.circular(12);
    const background = Color(0xff232432);
    const padding = EdgeInsets.all(16.0);

    final price = item.newPrice ?? item.product.price;

    return Column(
      children: [
        Container(
          padding: padding,
          decoration: const BoxDecoration(
            color: Color(0xff333543),
            borderRadius: BorderRadius.vertical(
              top: large,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.product.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              InventoryIcon(count: item.count),
            ],
          ),
        ),
        Container(
          height: 1,
          color: const Color(0xff5D5D6A),
        ),
        Container(
          padding: padding,
          decoration: const BoxDecoration(
            color: Color(0xff303142),
            borderRadius: BorderRadius.vertical(
              bottom: large,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: RowPadded(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const IconButtonOutlined(icon: Icons.loyalty),
                    ColumnPadded(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "السعر",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6C4134),
                          ),
                        ),
                        Text(
                          "$price",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF07914),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RowPadded(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const IconButtonOutlined(icon: Icons.loyalty),
                    ColumnPadded(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "المجموع الكلي",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6C4134),
                          ),
                        ),
                        Text(
                          "${price * item.count}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF07914),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
