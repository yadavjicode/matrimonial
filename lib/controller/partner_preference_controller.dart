import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/partner_preference_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../utils/connection_check/connectivity_service.dart';

class PartnerPreferenceController with ChangeNotifier {
  final ApiService apiService = ApiService();
  PartnerModel? _member;
  var isLoading = false.obs;
  String? _error;
  PartnerModel? get member => _member;
  String? get error => _error;
  final FlowController flowController=Get.put(FlowController());
final EditProfileController _editProfileController =
      Get.put(EditProfileController());
       final ConnectivityService connectivityService =
      Get.put(ConnectivityService());
      
  Future<void> partnerPreference(
      BuildContext context,
      String ageFrom,
      String ageto,
      String weightFrom,
      String weightTo,
      String heightFrom,
      String heightTo,
      String language,
      String maritalStatus,
      String familyType,
      String familyValue,
      String country,
      String state,
      String highQual,
      String profQual,
      String occupation,
      String income,
      String religion,
      String Caste,
      String diet,
      String drink,
      String smoke,
      bool status
      ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.partnerPreference(
          ageFrom,
          ageto,
          weightFrom,
          weightTo,
          heightFrom,
          heightTo,
          language,
          maritalStatus,
          familyType,
          familyValue,
          country,
          state,
          highQual,
          profQual,
          occupation,
          income,
          religion,
          Caste,
          diet,
          drink,
          smoke);
        if(status){
         _editProfileController.userDetails(context);
        Navigator.pop(context);
        }else{
          flowController.Flow(context, 14);
        }
          
      // Get.toNamed("/dashboard");
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
