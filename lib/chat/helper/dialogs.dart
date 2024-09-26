import 'package:devotee/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg),
        backgroundColor: AppColors.primaryColor.withOpacity(.8),
        behavior: SnackBarBehavior.floating));
  }

  static void showSnackbarPop(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
            content: Text(msg),
            backgroundColor: AppColors.primaryColor.withOpacity(.8),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1)))
        .closed
        .then((_) {
      Navigator.pop(context);
    });
  }

  static void showSnackbarPack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          content: Text(
              'Hare Krishna!\nDear user, this ${msg} is not available for free members. Please buy our premium membership which is very budget friendly and enjoy all the features. \u{1F60A}'),
          backgroundColor: AppColors.primaryColor.withOpacity(.8),
          behavior: SnackBarBehavior.floating,
          // duration: Duration(seconds: 2)
        ))
        .closed
        .then((_) {
      Get.toNamed("/package");
    });
  }

  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            const Center(child: CircularProgressIndicator(strokeWidth: 1)));
  }
}
