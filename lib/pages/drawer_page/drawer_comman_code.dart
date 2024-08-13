import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';

class DrawerCommanCode {
  Widget buildText(String text) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: FontConstant.styleMedium(fontSize: 12, color: AppColors.black),
        ));
  }

  Widget buildTextBold(String text) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: FontConstant.styleBold(fontSize: 12, color: AppColors.black),
        ));
  }

  Widget buildTextSemiBold(String text) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          // textAlign: TextAlign.justify,
          style: FontConstant.styleSemiBold(
              fontSize: 16, color: AppColors.primaryColor),
        ));
  }

  Widget question(String a, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$a) ",
          textAlign: TextAlign.justify,
          style: FontConstant.styleMedium(fontSize: 12, color: AppColors.black),
        ),
        Expanded(
          child: Text(
            "$text",
            textAlign: TextAlign.justify,
            style:
                FontConstant.styleMedium(fontSize: 12, color: AppColors.black),
          ),
        )
      ],
    );
  }
}
