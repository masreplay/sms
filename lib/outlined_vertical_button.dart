import 'package:flutter/material.dart';
import 'package:sms/flex_padded.dart';

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
