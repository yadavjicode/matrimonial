import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/education_details_model.dart';
import 'package:devotee/model/partner_preference_model.dart';
import 'package:devotee/model/professional_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class PartnerPreferenceController with ChangeNotifier {
  final ApiService apiService = ApiService();
  PartnerModel? _member;
  var isLoading = false.obs;
  String? _error;
  PartnerModel? get member => _member;
  String? get error => _error;
  final FlowController flowController=Get.put(FlowController());

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
      String smoke) async {
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
          flowController.Flow(context, 13);
      // Get.toNamed("/dashboard");
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
