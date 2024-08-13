import 'package:devotee/model/about_groombride_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class AboutGroomBrideController with ChangeNotifier {
  final ApiService apiService = ApiService();
  AboutGroomBrideModel? _member;
  var isLoading = false.obs;
  String? _error;
  AboutGroomBrideModel? get member => _member;
  String? get error => _error;

  Future<void> aboutGroomBride(
      BuildContext context, String characteristics, String hobbies) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.aboutGroomBride(characteristics, hobbies);
      Get.toNamed('/horoscope');
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
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
