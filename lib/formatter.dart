import 'package:intl/intl.dart';

extension TextFormatter on String {
  // 5000
  // 5,000
  String threeDigitFormatter() =>
      NumberFormat.decimalPattern().format(int.tryParse(this) ?? 0);
}
