import 'package:devotee/constants/widget/dialogs.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/model/accepted_model.dart';
import 'package:devotee/model/dashboard_model.dart';
import 'package:devotee/model/declined_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class DashboardController with ChangeNotifier {
  final ApiService apiService = ApiService();
  DashboardModel? _member;
  var isLoading = false.obs;
  String? _error;
  DashboardModel? get member => _member;
  String? get error => _error;

  Future<void> dashboard(
    BuildContext context,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Dashboard();
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
     Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
