import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
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
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  Future<void> aboutGroomBride(
      BuildContext context, String characteristics, String hobbies,bool status) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.aboutGroomBride(characteristics, hobbies);
      // ignore: use_build_context_synchronously
      if(status){
       _editProfileController.userDetails(context);
        Navigator.pop(context);
      }else{
       flowController.Flow(context, 12);
      }
      
      // Get.toNamed('/horoscope');
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
