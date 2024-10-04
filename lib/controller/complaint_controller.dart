import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/complaint_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class ComplaintController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ComplaintModel? _member;
  var isLoading = false.obs;
  String? _error;
  ComplaintModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> complaint(
    BuildContext context,
    String name, String phoneno, String email, String complaint
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Complaint(name,phoneno,email
      ,complaint);
      // ignore: use_build_context_synchronously
      Dialogs.showSnackbarPop(context, '${member?.message}');
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
