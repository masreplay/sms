import 'package:flutter/material.dart';
import 'package:sms/cart_model.dart';
import 'package:sms/flex_padded.dart';
import 'package:sms/formatter.dart';

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

    final price = (item.newPrice ?? item.product.price) * item.count;

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: const Color(0xff303142),
        ),
        child: RowPadded(
          children: [
            Expanded(
              child: Hero(
                tag: item.product.name,
                child: Text(item.product.name),
              ),
            ),
            const InventoryIcon(count: 1),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: price.toString().threeDigitFormatter(),
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
      ),
    );
  }
}

class InventoryIcon extends StatelessWidget {
  const InventoryIcon({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "$count",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: count == 0
                  ? const Color(0xff828791)
                  : const Color(0xffD36441),
            ),
          ),
        ],
      ),
    );
  }
}
