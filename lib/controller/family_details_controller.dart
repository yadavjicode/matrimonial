import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/family_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class FamilyDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  FamilyDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  FamilyDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController=Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
   final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> familyDetails(
      BuildContext context,
      String religion,
      String caste,
      String subcaste,
      String gothram,
      String language,
      String motherTongue,
      String fatherlivingstatus,
      String fathername,
      String fathersoccupation,
      String fatherBussness,
      String fatherAnnualIncome,
      String motherlivingstatus,
      String mothersname,
      String mothersoccupation,
      String motherAnnualIncome,
      String sister,
      String noofsisters,
      String brother,
      String noofbrothers,
      String familyType,
      String familyvalues,
      String familyStatus,bool status) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.familyDetails(
          religion,
          caste,
          subcaste,
          gothram,
          language,
          motherTongue,
          fatherlivingstatus,
          fathername,
          fathersoccupation,
          fatherBussness,
          fatherAnnualIncome,
          motherlivingstatus,
          mothersname,
          mothersoccupation,
          motherAnnualIncome,
          sister,
          noofsisters,
          brother,
          noofbrothers,
          familyType,
          familyvalues,
          familyStatus);

      if(status){
        _editProfileController.userDetails(context);
        Navigator.pop(context);
      }else{
       flowController.Flow(context, 8);
      }
      
    // Get.toNamed('/aboutgroom');
    } catch (e) {
      _error = e.toString();
      print(_error);

    // Show error message using ScaffoldMessenger
     if (!connectivityService.isConnected.value) {
        Dialogs.showSnackbar(context, "No internet connection!");
      } else {
        Dialogs.showSnackbar(context,
            "Something went wrong while fetching data. Please try again later!");
      }
      
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
