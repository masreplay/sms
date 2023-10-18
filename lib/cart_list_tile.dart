import 'package:flutter/material.dart';
import 'package:sms/cart_model.dart';
import 'package:sms/flex_padded.dart';

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
