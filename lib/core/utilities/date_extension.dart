import 'package:intl/intl.dart';

extension CustomDateFormat on DateTime {
  String get dmyhmFormat => DateFormat('dd/MM/yy - HH:mm').format(this);
}
