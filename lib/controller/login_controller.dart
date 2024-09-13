import 'package:devotee/api_service/api_service.dart';
import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/model/login_model.dart';
import 'package:devotee/pages/auth/otp_page/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController with ChangeNotifier {
  final ApiService apiService = ApiService();
  LoginModel? _member;
  var isLoading = false.obs;
  String? _error;
  final TextEditingController mobileno = TextEditingController();
  LoginModel? get member => _member;
  String? get error => _error;

  Future<void> login(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.login(mobileno.text.toString().trim());

      print('${_member?.data?.data}');

      // ignore: use_build_context_synchronously
      Dialogs.showSnackbar(context, '${_member?.data?.data}');
      Get.off(() => OTPScreen(mobileNumber: mobileno.text.toString().trim()));

      print("success");
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
