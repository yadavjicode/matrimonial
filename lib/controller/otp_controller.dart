import 'package:devotee/api_service/api_service.dart';
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

  Future<void> otp(String mobileNo, String otp, BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      // Perform OTP authentication
      _member = await apiService.otp(mobileNo, otp);

      // Save token to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = _member?.datas?.data?.token;
      final name = _member?.datas?.data?.member?.name;
      final id = _member?.datas?.data?.member?.matriID;
      final email = _member?.datas?.data?.member?.confirmEmail;
      final profile = _member?.datas?.data?.member?.profileImage;

      if (token != null) {
        await prefs.setString('token', token);
        await prefs.setString('name', name ?? "");
        await prefs.setString('id', id ?? "");
        await prefs.setString('email', email ?? "");
        await prefs.setString('profile', token);
      } else {
        throw Exception('Token is null');
      }

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey.shade200,
          content: Text(
            _member?.datas?.data?.message ?? 'Success',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
     
      // Navigate to profile page
      Get.toNamed('/profile1');
    } catch (e) {
      _error = e.toString();
      print('Error: $_error');

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey.shade200,
          content: Text(
            _error ?? 'An unknown error occurred',
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
