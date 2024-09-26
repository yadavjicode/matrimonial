import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotificationController notificationController = Get.find();

    return Obx(() {
      return Center(
        child: Text("${notificationController.notificationCount}",
            style: FontConstant.styleRegular(
                fontSize: 22, color: AppColors.primaryColor)),
      );
    });
  }
}
