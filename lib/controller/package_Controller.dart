
import 'package:devotee/model/package_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../constants/widget/Snackbar.dart';
import '../utils/connection_check/connectivity_service.dart';

class PackageController with ChangeNotifier {
  final ApiService apiService = ApiService();
  PackageModel? _member;
  var isLoading = false.obs;
  String? _error;
  PackageModel? get member => _member;
  String? get error => _error;
 final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> package(
    BuildContext context
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Package();
     

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
