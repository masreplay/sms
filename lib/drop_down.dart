import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DropdownFormField<T> extends StatefulHookWidget {
  const DropdownFormField({
    super.key,
    required this.items,
    required this.itemTextBuilder,
    required this.onChanged,
  });

  final List<T> items;
  final String Function(T value) itemTextBuilder;
  final ValueChanged<T> onChanged;

  @override
  State<DropdownFormField<T>> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T> extends State<DropdownFormField<T>> {
  final controller = OverlayPortalController();
  final link = LayerLink();

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xff232430);
    const radius = Radius.circular(8);

    final searchController = useTextEditingController();
    final focusNode = useFocusNode();

    return LayoutBuilder(
      builder: (context, constraints) {
        return CompositedTransformTarget(
          link: link,
          child: OverlayPortal(
            controller: controller,
            overlayChildBuilder: (BuildContext context) {
              return CompositedTransformFollower(
                link: link,
                targetAnchor: Alignment.bottomLeft,
                offset: const Offset(-32, 0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.vertical(bottom: radius),
                    ),
                    width: constraints.maxWidth,
                    height: 200,
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          final T item = widget.items[index];
                          return InkWell(
                            onTap: () {
                              widget.onChanged(item);
                              controller.hide();
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xff2C2C3B),
                              ),
                              child: Text(
                                widget.itemTextBuilder(item),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: radius,
                  bottom: controller.isShowing ? Radius.zero : radius,
                ),
                color: backgroundColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      focusNode: focusNode,
                      onTap: () {
                        controller.toggle();
                        setState(() {});
                      },
                      decoration: const InputDecoration.collapsed(
                        border: InputBorder.none,
                        hintText: 'بحث عن',
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Color(0xff6D6D7E),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 2,
                    height: 48,
                    color: const Color(0xFF1A1B24),
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.isShowing) {
                        controller.hide();
                        FocusScope.of(context).unfocus();
                      } else {
                        controller.show();
                      }

                      setState(() {});
                    },
                    child: Icon(
                      controller.isShowing
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: const Color(0xff6D6D7E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// extension ValueNotifierX<T> on ValueNotifier<T> {
//   T update(T value) => this.value = value;
// }
