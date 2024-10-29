import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/block_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../utils/connection_check/connectivity_service.dart';

class BlockProfileController with ChangeNotifier {
  final ApiService apiService = ApiService();
  BlockProfileModel? _member;
  var isLoading = false.obs;
  String? _error;
  BlockProfileModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> blockProfile(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.blockProfile();
    } catch (e) {
      _error = e.toString();
      print(_error);
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
