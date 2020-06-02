import 'package:intl/intl.dart';

class Util{
  static String appId="bd395441438fb84ce04ed829e06d47a8";
  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE, MMM dd, y").format(dateTime);
  }
  static String getDayOfWeek(DateTime dateTime){
    return new DateFormat("EEEE").format(dateTime);
  }
}