import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/account_setting_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class AccountSettingController with ChangeNotifier {
  final ApiService apiService = ApiService();
  AccountSettingModel? _member;
  var isLoading = false.obs;
  String? _error;
  AccountSettingModel? get member => _member;
  String? get error => _error;
  final EditProfileController userProfileController =
      Get.put(EditProfileController());

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
      Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}