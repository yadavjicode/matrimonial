import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/professional_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class ProfessionalDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ProfessionalDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  ProfessionalDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController=Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  Future<void> professionalDetails(
      BuildContext context,
      String profesion,
      String working,
      String empolyment,
      String workingState,
      String workingCity,
      String pincode,
      String annualSalary,bool status) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.professionalDetails(profesion, working,
          empolyment, workingState, workingCity, pincode, annualSalary);
      
      if(status){
       _editProfileController.userDetails(context);
        Navigator.pop(context);
      }else{
        flowController.Flow(context, 6);
      }
      
    
      // Get.toNamed('/devotion');
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
