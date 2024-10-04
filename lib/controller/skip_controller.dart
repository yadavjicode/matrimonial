import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../model/skip_model.dart';
import '../utils/connection_check/connectivity_service.dart';

class SkipController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SkipModel? _member;
  var isLoading = false.obs;
  String? _error;
  SkipModel? get member => _member;
  String? get error => _error;
  final FlowController flowController = Get.put(FlowController());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> skip(BuildContext context, String step, int pageno) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();
    try {
      _member = await apiService.skip(step);
      flowController.Flow(context, pageno);
    } catch (e) {
      _error = e.toString();
      print(_error);

      if (!connectivityService.isConnected.value) {
        Dialogs.showSnackbar(context, "No internet connection!");
      } else {
        Dialogs.showSnackbar(context, "error: $_error");
      }
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
