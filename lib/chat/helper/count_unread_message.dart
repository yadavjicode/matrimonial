import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';

class CountUnreadMessage extends StatelessWidget {
  CountUnreadMessage();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: APIs.getTotalUnreadMessagesCount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            '0',
            style: FontConstant.styleRegular(
                fontSize: 22, color: AppColors.primaryColor),
          );
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final unreadCount = snapshot.data ?? 0;
        return Text(
          '$unreadCount',
          style: FontConstant.styleRegular(
              fontSize: 22, color: AppColors.primaryColor),
        );
      },
    );
  }
}
