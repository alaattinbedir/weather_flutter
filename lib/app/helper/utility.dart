import 'package:intl/intl.dart';

class Utility {
  static final Utility _utility = Utility._internal();

  factory Utility() {
    return _utility;
  }

  Utility._internal();

  String getDateWithFormat(int timestamp, String dateFormat) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    var formatter = DateFormat(dateFormat);
    String formatted = formatter.format(date);

    return formatted;
  }

  String getDayFromDate(int date) {
    return getDateWithFormat(date, "EEEE");
  }

  String getHourFromDate(int date) {
    return getDateWithFormat(date, "HH");
  }

  String getFormatedDate(int date) {
    return getDateWithFormat(date, "MMM d, yyyy");
  }

  double convertFahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) / 1.8;
  }

  String convertFahrenheitToCelsiusAsString(double fahrenheit) {
    int celsiusDegree = convertFahrenheitToCelsius(fahrenheit).toInt();
    return '$celsiusDegree' '°';
  }
}
