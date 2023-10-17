import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sms/add_invoice.dart';

class AppDropdownButtonFormField extends HookWidget {
  const AppDropdownButtonFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final isOpened = useState(false);

    const labelText = 'بحث عن';

    const backgroundColor = Color(0xff232430);
    const foregroundColor = Color(0xffFEFEFE);
    return DropdownButtonFormField2(
      isExpanded: true,
      value: null,
      items: [
        for (final product in products)
          DropdownMenuItem(
            value: product,
            child: Text(product.name),
          ),
      ],
      selectedItemBuilder: (_) => [const Text(labelText)],
      barrierColor: Colors.transparent,
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
          color: backgroundColor,
        ),
        // offset: const Offset(-20, 0),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(50),
          thickness: MaterialStateProperty.all(4),
          thumbVisibility: MaterialStateProperty.all(true),
        ),
      ),
      iconStyleData: IconStyleData(
        icon: RotationTransition(
          turns: isOpened.value
              ? const AlwaysStoppedAnimation(0.5)
              : const AlwaysStoppedAnimation(0),
          child: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: foregroundColor,
          ),
        ),
      ),
      onMenuStateChange: isOpened.update,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: const Text(labelText, style: TextStyle(color: foregroundColor)),
        fillColor: backgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {},
    );
  }
}

extension ValueNotifierX<T> on ValueNotifier<T> {
  T update(T value) => this.value = value;
}
