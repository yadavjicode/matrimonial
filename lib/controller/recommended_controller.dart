import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/recommended_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../constants/widget/Snackbar.dart';

class RecommendedController with ChangeNotifier {
  final ApiService apiService = ApiService();
  RecommendedModel? _member;
  var isLoading = false.obs;
  String? _error;
  RecommendedModel? get member => _member;
  String? get error => _error;
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  Future<void> recommended(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();
  
    try {
      _member = await apiService.recommended();
    } catch (e) {
      _error = e.toString();
      print(_error);

      Dialogs.showSnackbar(context, "Error: $_error");
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
