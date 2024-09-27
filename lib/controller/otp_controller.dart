import 'package:devotee/api_service/api_service.dart';
import 'package:devotee/constants/widget/dialogs.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/otp_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController with ChangeNotifier {
  final ApiService apiService = ApiService();
  OtpModel? _member;
  var isLoading = false.obs;
  String? _error;
  OtpModel? get member => _member;
  String? get error => _error;

  FlowController flowController = Get.put(FlowController());

  Future<void> otp(String mobileNo, String otp, BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      // Perform OTP authentication
      _member = await apiService.otp(mobileNo, otp);
      final prefs = await SharedPreferences.getInstance();
      final token = _member?.responseData?.token;
      if (token != null) {
        await prefs.setString('token', token);
      } else {
        throw Exception('Invalid OTP');
      }
      Dialogs.showSnackbar(context, "${_member?.responseData?.message}");

      flowController.Flow(context, 0);

      // Get.toNamed('/profile1');
    } catch (e) {
      _error = e.toString();
      print('Error: $_error');

      // Show error message
      Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
