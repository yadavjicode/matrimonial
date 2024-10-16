import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/suggestion_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class SuggestionController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SuggestionModel? _member;
  var isLoading = false.obs;
  String? _error;
  SuggestionModel? get member => _member;
  String? get error => _error;
 final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> suggestion(
    BuildContext context,
    String email,
    String suggestion,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Suggestion(email,suggestion);

      // ignore: use_build_context_synchronously
      Dialogs.showSnackbarPop(context, '${member?.message}');
    } catch (e) {
      _error = e.toString();
      print(_error);
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
