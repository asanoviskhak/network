import 'package:intl/intl.dart';

class Util{
  static String appId="f97f58e9b36f4144ad2104504201006";
  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM dd, y").format(dateTime);
  }
  static String getDayOfWeek(DateTime dateTime){
    return new DateFormat("EEEE").format(dateTime);
  }
  static String getHour(DateTime dateTime){
    return new DateFormat("HH:mm").format(dateTime);
  }
}