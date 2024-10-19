import 'package:devotee/api_service/api_service.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/login_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/connection_check/connectivity_service.dart';

class LoginController with ChangeNotifier {
  final ApiService apiService = ApiService();
  LoginModel? _member;
  var isLoading = false.obs;
  String? _error;
  // final TextEditingController mobileno = TextEditingController();
  LoginModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> login(BuildContext context, String phoneEmail, String go) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.login(phoneEmail);

      print('${_member?.responseData?.data}');

      // ignore: use_build_context_synchronously
      Dialogs.showSnackbar(context, '${_member?.responseData?.data}');
      // Get.off(() => OTPScreen(mobileNumber: phoneEmail));

      Get.offAndToNamed("/otp",
          arguments: {"phoneEmail": phoneEmail, "go": go});

      print("success");
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
