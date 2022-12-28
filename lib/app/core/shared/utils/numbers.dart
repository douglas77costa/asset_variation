import 'package:intl/intl.dart';

extension Numbers on num {
  String doubleFormat() {
    final currency = NumberFormat.currency(locale: "pt_BR", symbol: "");
    return currency.format(this);
  }

  String formatCurrency() {
    final currency = NumberFormat.currency(locale: "pt_BR", symbol: "\$");
    return currency.format(this);
  }
}
