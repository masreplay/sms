import 'package:flutter/material.dart';

import 'drop_down.dart';

class AddInvoiceScreen extends StatelessWidget {
  const AddInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فاتورة بيع: فوائد الودائع الثابتة'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppDropdownButtonFormField(),
          ],
        ),
      ),
    );
  }
}

final products = [
  const Product(name: "تست"),
  const Product(name: "Hat"),
  const Product(name: "Blue shirt"),
  const Product(name: "Package quantity test"),
  const Product(name: "test2"),
  const Product(name: "test5"),
  const Product(
    name:
        "asdadadsa asdad a d asd a sdawdawd aLorem ipsum dolor sit amet, consectetur adipiscing elit. Done quis sapien mi. Phasellus sed ante molestie, maximus lacus at, sagittis metus e molestie, maximus lacus at, sagittis metus",
  ),
];

class Product {
  final String name;
  final double? price;

  const Product({
    required this.name,
    this.price,
  });
}
