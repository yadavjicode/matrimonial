import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/account_setting_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class AccountSettingController with ChangeNotifier {
  final ApiService apiService = ApiService();
  AccountSettingModel? _member;
  var isLoading = false.obs;
  String? _error;
  AccountSettingModel? get member => _member;
  String? get error => _error;
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> accountSetting(
      BuildContext context, String key, int value) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.accountSetting(key, value);
      userProfileController.userDetails(context);
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Dialogs.showSnackbar(context, "${member!.message}");
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
