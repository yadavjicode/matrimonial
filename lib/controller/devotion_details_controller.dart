import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
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
  final FlowController flowController=Get.put(FlowController());
   final EditProfileController _editProfileController =
      Get.put(EditProfileController());


  Future<void> devotionalDetails(
      BuildContext context,
      String somethingAbout,
      String iskontype,
      String templeName,
      String templeCity,
      String devotionalHobbies,bool status) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.devotionalDetails(
          somethingAbout, iskontype, templeName, templeCity, devotionalHobbies);
    
    if(status){
       _editProfileController.userDetails(context);
        Navigator.pop(context);

    }else{
      flowController.Flow(context, 7);
    }

    
      // Get.toNamed('/spiritual');
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
