import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/declined_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../constants/widget/Snackbar.dart';
import '../utils/connection_check/connectivity_service.dart';

class DeclinedController with ChangeNotifier {
  final ApiService apiService = ApiService();
  DeclinedModel? _member;
  var isLoading = false.obs;
  String? _error;
  DeclinedModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> declined(
    BuildContext context,
    String id, {
    VoidCallback? btnOkOnPress,
  }) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Declined(id);
      // ignore: use_build_context_synchronously
      CustomDialog.show(
        context,
        'Declined',
        '${member!.message}',
        dialogType: DialogType.error,
        btnOkOnPress: btnOkOnPress ?? () {},
      );
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
