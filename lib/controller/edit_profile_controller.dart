import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class EditProfileController with ChangeNotifier {
  final ApiService apiService = ApiService();
  UserModel? _member;
  var isLoading = false.obs;
  String? _error;
  UserModel? get member => _member;
  String? get error => _error;


  Future<void> userDetails(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.userDetails();

      
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
      Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
