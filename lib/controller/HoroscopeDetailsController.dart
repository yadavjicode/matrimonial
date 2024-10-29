import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/horoscope_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class HoroscopeDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  HoroscopeDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  HoroscopeDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> horoscopeDetails(
      BuildContext context,
      String timeHoroscope,
      String country,
      String stateHoroscope,
      String cityHoroscope,
      bool status) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.horoscopeDetails(
          timeHoroscope, country, stateHoroscope, cityHoroscope);
      if (status) {
        _editProfileController.userDetails(context);
        Navigator.pop(context);
      } else {
        flowController.Flow(context, 10);
      }

      // Get.toNamed('/profile');
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
