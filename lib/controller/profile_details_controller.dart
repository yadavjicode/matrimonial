import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/profile_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class ProfileDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ProfileDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  ProfileDetailsModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> profileDetails(BuildContext context, String id, String keys,
      List<dynamic>? search) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.ProfileDetails(id);
     
      if (_member != null) {
        // Navigate with the correct key name
        Get.toNamed('/profiledtls', arguments: {
          "keys": keys,
          "ageFrom": search![0] ?? "",
          "ageTo": search[1] ?? "",
          "heightFrom": search[2] ?? "",
          "heightTo": search[3] ?? "",
          "maritalStatus": search[4] ?? "",
          "religion": search[5] ?? "",
          "caste": search[6] ?? "",
          "country": search[7] ?? "",
          "state": search[8] ?? "",
          "city": search[9] ?? "",
          "education": search[10] ?? ""
        });
      } else {
        throw Exception("Profile details not found.");
      }
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
