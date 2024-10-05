import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/inbox_received_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class InboxReceivedController with ChangeNotifier {
  final ApiService apiService = ApiService();
  InboxReceivedModel? _member;
  var isLoading = false.obs;
  String? _error;
  InboxReceivedModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> inboxSent(
    BuildContext context,
    String status,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.InboxReceived(status);
    } catch (e) {
      _error = e.toString();
      print(_error);
      _member = null;
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
