import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../constants/widget/Snackbar.dart';
import '../model/html_content_model.dart';
import '../utils/connection_check/connectivity_service.dart';

class HtmlContentController with ChangeNotifier {
  final ApiService apiService = ApiService();
  HtmlContentModel? _member;
  var isLoading = false.obs;
  String? _error;
  HtmlContentModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> htmlContent(
    BuildContext context,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();
    try {
      _member = await apiService.htmlContent();
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
