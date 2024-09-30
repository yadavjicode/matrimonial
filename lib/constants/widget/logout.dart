import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restart_app/restart_app.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await APIs.updateActiveStatus(false);
    await prefs.setString('token', "");
    Get.delete<EditProfileController>();

    // Delay a little to ensure the dialog is fully closed before restarting
    // await Future.delayed(Duration(milliseconds: 100));

    // Restart the app after logout
    Restart.restartApp();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout Confirmation',
          style:
              FontConstant.styleSemiBold(fontSize: 17, color: AppColors.black)),
      backgroundColor: AppColors.background,
      content: Text('Are you sure you want to log out?',
          style:
              FontConstant.styleRegular(fontSize: 13, color: AppColors.black)),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Cancel',
            style: FontConstant.styleSemiBold(
                fontSize: 15, color: AppColors.black),
          ),
          onPressed: () {
            Get.back(); // Closes the dialog
          },
        ),
        TextButton(
          child: Text(
            'Logout',
            style: FontConstant.styleSemiBold(
                fontSize: 15, color: AppColors.black),
          ),
          onPressed: () {
            // Perform logout operation here
            logout(); // Restart the app
          },
        ),
      ],
    );
  }
}

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const LogoutConfirmationDialog();
    },
  );
}
