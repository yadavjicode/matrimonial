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

  Future<void> profileDetails(BuildContext context, String id, String type,
      String keys, List<dynamic>? search) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.ProfileDetails(id, type);

      if (_member != null) {
        // Navigate with the correct key name
        Get.toNamed('/profiledtls', arguments: {
          "type": type,
          "keys": keys,
          "name": search![0],
          "profession": search![1],
          "ageFrom": search![2] ?? "",
          "ageTo": search[3] ?? "",
          "heightFrom": search[4] ?? "",
          "heightTo": search[5] ?? "",
          "maritalStatus": search[6] ?? "",
          "religion": search[7] ?? "",
          "caste": search[8] ?? "",
          "country": search[9] ?? "",
          "state": search[10] ?? "",
          "city": search[11] ?? "",
          "education": search[12] ?? "",
          "profilePer": search[13] ?? "",
          "sort": search[14] ?? ""
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
