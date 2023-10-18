import 'package:flutter/material.dart';
import 'package:sms/add_invoice.dart';
import 'package:sms/snack_bar.dart';
import 'package:sms/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const themeMode = ThemeMode.dark;
    final theme = AppTheme();

    return MaterialApp(
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      theme: theme.buildLightTheme(),
      darkTheme: theme.buildDarkTheme(),
      home: const AddInvoiceScreen(),
      builder: (context, child) {
        if (child == null) return const SizedBox();

        const borderRadius = BorderRadius.only(
          topRight: Radius.circular(12),
        );

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Stack(
              children: [
                child,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    borderRadius: borderRadius,
                    onTap: () {
                      showUnimplementedSnackBar(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xff292838),
                        borderRadius: borderRadius,
                      ),
                      child: const Icon(
                        Icons.dark_mode,
                        size: 18,
                        color: Color(0xffEEBC3A),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
