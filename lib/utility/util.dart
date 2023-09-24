import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tops/constants/colorPallet.dart';

import '../auth/loginScreen.dart';

// Convert to Format Rupiah
class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

Future clearSession() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}

// Function LogOut
void logOut(BuildContext context) {
  ArtDialogResponse response;
  clearSession().then(
    (value) async => Navigator.of(context).pushNamedAndRemoveUntil(
      '/login',
      response = await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
          title: "Are you sure?",
          text: "You will logout from this page!",
          confirmButtonText: "Yes",
          denyButtonText: "Cancel",
          confirmButtonColor: ColorPallet.greenPrimary,
          denyButtonColor: Colors.red,
          type: ArtSweetAlertType.warning,
          onConfirm: () {
            Get.off(loginScreen());
          },
        ),
      ),
    ),
  );
}
