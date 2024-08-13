import 'package:devotee/api_service/api_service.dart';
import 'package:devotee/model/login_model.dart';
import 'package:devotee/model/otp_model.dart';
import 'package:devotee/pages/login/otp_page/otp_page.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Text(
          '${_member?.data?.data}',
          style: TextStyle(color: Colors.black),
        ),
      ));

      Get.to(() => OTPScreen(mobileNumber: mobileno.text.toString().trim()));
      print("success");
    } catch (e) {
      _error = e.toString();
      print(_error);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Text(
          '${_error}',
          style: TextStyle(color: Colors.black),
        ),
      ));
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
