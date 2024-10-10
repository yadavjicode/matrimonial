import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../chat/api/apis.dart';

class DialogConstant {
  static void packageDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Get Premium Now',
            style: FontConstant.styleSemiBold(
                fontSize: 17, color: AppColors.black)),
        backgroundColor: AppColors.background,
        content: Text(
            'Hare Krishna!\nDear user, this ${msg} is not available for free members. Please buy our premium membership which is very budget friendly and enjoy all the features. \u{1F60A}',
            textAlign: TextAlign.justify,
            style: FontConstant.styleRegular(
                fontSize: 13, color: AppColors.black)),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Not now',
              style: FontConstant.styleSemiBold(
                  fontSize: 15, color: AppColors.black),
            ),
          ),
          TextButton(
            onPressed: () => Get.toNamed("/membership"),
            child: Text(
              ' Upgrade',
              style: FontConstant.styleSemiBold(
                  fontSize: 15, color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }

  static Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App',
                style: FontConstant.styleSemiBold(
                    fontSize: 17, color: AppColors.black)),
            backgroundColor: AppColors.background,
            content: Text('Do you want to exit the app?',
                style: FontConstant.styleRegular(
                    fontSize: 15, color: AppColors.black)),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), // Cancel
                child: Text(
                  'Cancel',
                  style: FontConstant.styleSemiBold(
                      fontSize: 15, color: AppColors.black),
                ),
              ),
              TextButton(
                onPressed: () => {
                  APIs.updateActiveStatus(false),
                  Navigator.of(context).pop(true),
                }, // Exit
                child: Text(
                  'Exit',
                  style: FontConstant.styleSemiBold(
                      fontSize: 15, color: AppColors.black),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
