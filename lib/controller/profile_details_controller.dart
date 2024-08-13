import 'package:devotee/model/profile_details_model.dart';
import 'package:devotee/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class ProfileDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ProfileDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  ProfileDetailsModel? get member => _member;
  String? get error => _error;

  Future<void> profileDetails(
    BuildContext context,
    String id,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.ProfileDetails(id);
      Get.toNamed('/profiledtls');
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
