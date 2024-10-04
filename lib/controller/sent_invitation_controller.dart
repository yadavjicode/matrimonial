import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/sent_invitation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../constants/widget/Snackbar.dart';
import '../constants/widget/dialog.dart';
import '../utils/connection_check/connectivity_service.dart';

class SentInvitationController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SentInvitationModel? _member;
  var isLoading = false.obs;
  String? _error;
  SentInvitationModel? get member => _member;
  String? get error => _error;
   final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> sentInvitation(
    BuildContext context,
    String id, {
    VoidCallback? btnOkOnPress, // Optional btnOkOnPress function
  }) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.SentInvitation(id);

      if (_member?.status == "true") {
        CustomDialog.show(
          context,
          member?.message ?? "",
          member?.title ?? "",
          dialogType: DialogType.success,
          btnOkOnPress: btnOkOnPress ??
              () {
                // Navigator.of(context).pop(); // Default action if none is provided
              },
        );
      } else {
        DialogConstant.packageDialog(context, 'sent invitation feature');
      }
    } catch (e) {
      _error = e.toString();
      print(_error);
      if (!connectivityService.isConnected.value) {
        Dialogs.showSnackbar(context, "No internet connection!");
      } else {
        Dialogs.showSnackbar(context,
            "Something went wrong while fetching data. Please try again later!");
      }
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
