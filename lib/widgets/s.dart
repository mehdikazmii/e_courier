import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled5/theme/constant.dart';

class S {
  // static final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static const _chars = '1234567890';
  static String sDefaultImage =
      'https://firebasestorage.googleapis.com/v0/b/esolutionapps.appspot.com/o/uploads%2F2021-05-01%2015%3A01%3A40.011200?alt=media&token=728eaa2b-a46c-4c92-8029-5dc5d5fe2e47';

  static String sGetRandomString({int length = 4}) =>
      String.fromCharCodes(Iterable.generate(
          length, (_) => _chars.codeUnitAt(Random().nextInt(_chars.length))));

  static void sSnackBar({message = 'Something went wrong', title = 'Info'}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: primaryColor,
      colorText: Colors.white,
    );
  }

  static String sDateToString(DateTime dateTime) {
    String formatted = S.sDateFormatter().format(dateTime);
//    print(formatted); // something like 2013-04-20
    return formatted;
  }

  static const String sGetMonthDayAndTimeForDifference = 'dd-MM-yy, hh:mm a';

  static DateFormat sDateFormatter() {
    return DateFormat(S.sGetMonthDayAndTimeForDifference);
  }
}
