import 'package:devotee/api_service/api_service.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/profile_a_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/connection_check/connectivity_service.dart';

class ProfileAController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ProfileAModel? _member;
  var isLoading = false.obs;
  String? _error;
  ProfileAModel? get member => _member;
  String? get error => _error;
  FlowController flowController = Get.put(FlowController());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> profileA(
      BuildContext context, String profileFor, String gender) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.profileA(profileFor, gender);
      flowController.Flow(context, 0);
      // Get.toNamed('/profile2');
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

  int profileFor(String? profile) {
    if (profile != null) {
      switch (profile) {
        case "Myself":
          return 0;
        case "My Relative":
          return 1;
        case "My Son":
          return 2;
        case "My Daughter":
          return 3;
        case "My Brother":
          return 4;
        case "My Sister":
          return 5;
        case "My Friend":
          return 6;
        case "My Counselee":
          return 7;
        default:
          return -1; // Return -1 if none of the cases match
      }
    } else {
      return -1; // Return -1 if profile is null
    }
  }

  int gender(String? gender) {
    if (gender != null) {
      if (gender == "Male") {
        return 0;
      } else if (gender == "Female") {
        return 1;
      } else {
        return -1;
      }
    } else {
      return -1;
    }
  }
}
