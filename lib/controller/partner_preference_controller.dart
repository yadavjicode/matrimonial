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
      Get.toNamed("/dashboard");
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
