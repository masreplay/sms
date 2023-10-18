import 'package:flutter/material.dart';
import 'package:sms/add_invoice.dart';
import 'package:sms/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const themeMode = ThemeMode.dark;
    final theme = AppTheme();

    return MaterialApp(
      themeMode: themeMode,
      theme: theme.buildLightTheme(),
      darkTheme: theme.buildDarkTheme(),
      home: const AddInvoiceScreen(),
      builder: (context, child) {
        if (child == null) return const SizedBox();

        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
    );
  }
}
