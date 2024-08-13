import 'package:devotee/model/devotion_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class DevotionalDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  DevotionalDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  DevotionalDetailsModel? get member => _member;
  String? get error => _error;

  Future<void> devotionalDetails(
      BuildContext context,
      String somethingAbout,
      String iskontype,
      String templeName,
      String templeCity,
      String devotionalHobbies) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.devotionalDetails(
          somethingAbout, iskontype, templeName, templeCity, devotionalHobbies);
      Get.toNamed('/spiritual');
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
