import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  Future<void> logout() async {
    print('ufygkhilj');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', "");

    Get.delete<EditProfileController>();
    Get.offAndToNamed("login");
    // Add any logic you need to handle the token here
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Logout Confirmation'),
      content: Text('Are you sure you want to log out?'),
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
            Get.back(); // Closes the dialog
            logout(); // Navigate to login screen
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
      return LogoutConfirmationDialog();
    },
  );
}
