import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomDialog {
  static void show(
    BuildContext context,
    String title,
    String message, {
    required DialogType dialogType, VoidCallback? btnOkOnPress// Dynamic dialog type
   // List<Widget>? additionalWidgets,
  }) {
    
    AwesomeDialog(
        context: context,
        dialogType: dialogType,
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false, 
        animType: AnimType.topSlide,
        closeIcon: const Icon(Icons.close_fullscreen_outlined),
        title: title,
        titleTextStyle: FontConstant.styleBold(fontSize: 17, color: AppColors.black),
 //     fontSize: Dimensions.PADDING_SIZE_DEFAULT, color: Colors.black),
        desc: message,
      //   body: Column(
      //   children: [
      //     if (additionalWidgets != null) ...additionalWidgets!,
      //   ],
      // ),
        descTextStyle:FontConstant.styleRegular(fontSize: 13, color: AppColors.black),
      // poppinstMedium.copyWith(fontSize: 17, color: Colors.black),
        btnCancelColor: Colors.grey[500],
        btnOkColor: Colors.green,
        btnOkOnPress: btnOkOnPress ?? () {
        // Default action if none is provided
        Navigator.of(context).pop();
      },
  
      ).show();
  }
}
