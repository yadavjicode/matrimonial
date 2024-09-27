import 'package:devotee/constants/widget/dialogs.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/photo_delete_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class PhotoDeleteController with ChangeNotifier {
  final ApiService apiService = ApiService();
  PhotoDeleteModel? _member;
  var isLoading = false.obs;
  String? _error;
  PhotoDeleteModel? get member => _member;
  String? get error => _error;
  final EditProfileController userProfileController =
      Get.put(EditProfileController());

  Future<void> photoDelete(
      BuildContext context, String key, int value) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.photoDelete(key, value);
      userProfileController.userDetails(context);
      Dialogs.showSnackbar(context, "${member!.message}");
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
