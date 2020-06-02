import 'package:intl/intl.dart';

class Util{
  static String appId="bd395441438fb84ce04ed829e06d47a8";
  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEE, MMM dd, y").format(dateTime);
  }
}