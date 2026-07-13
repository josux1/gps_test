import 'package:intl/intl.dart';

class AppFormat {
  static String distanceToKm(int distance) {
    final formatter = NumberFormat("#,###");
    return "${formatter.format(distance)} km";
  }
}
