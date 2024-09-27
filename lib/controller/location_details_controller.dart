import 'package:devotee/constants/widget/dialogs.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/location_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class LocationDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  LocationDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  LocationDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  Future<void> locationDetails(
      BuildContext context,
      String country,
      String residence,
      String permanentHouse,
      String permanentState,
      String permanentcity,
      String permanentPincode,
      String temporaryState,
      String temporaryCity,
      String temporaryPincode,
      String referARelation,
      String referAName,
      String referAEmail,
      String referAMobileno,
      String referBRelation,
      String referBName,
      String referBEmail,
      String referBMobileno,
      bool status) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.LocationDetails(
          country,
          residence,
          permanentHouse,
          permanentState,
          permanentcity,
          permanentPincode,
          temporaryState,
          temporaryCity,
          temporaryPincode,
          referARelation,
          referAName,
          referAEmail,
          referAMobileno,
          referBRelation,
          referBName,
          referBEmail,
          referBMobileno);

      if (status) {
        _editProfileController.userDetails(context);
        Navigator.pop(context);
      } else {
        flowController.Flow(context, 4);
      }

      // Get.toNamed('/education');
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
