import 'package:flutter/material.dart';

void showUnimplementedSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("لم يتم اضافة هذه الميزة بعد"),
    ),
  );
}
