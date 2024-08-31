import 'package:devotee/constants/color_constant.dart';
import 'package:flutter/material.dart';

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

  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            const Center(child: CircularProgressIndicator(strokeWidth: 1)));
  }
}
