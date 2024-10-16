import 'package:devotee/model/shortlisted_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../constants/widget/Snackbar.dart';
import '../utils/connection_check/connectivity_service.dart';

class ShortlistedListController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ShortlistedListModel? _member;
  var isLoading = false.obs;
  String? _error;
  ShortlistedListModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> shortlisted(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Shortlisted();
      //  CustomDialog.show(
      //             context,
      //             'Shortlist',
      //             '${member!.message}',
      //             dialogType:DialogType.success,

      //           );
    } catch (e) {
      _error = e.toString();
      if (!connectivityService.isConnected.value) {
        Dialogs.showSnackbar(context, "No internet connection!");
      } else {
        Dialogs.showSnackbar(context, "Something went wrong while fetching data. Please try again later!");
      }
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
