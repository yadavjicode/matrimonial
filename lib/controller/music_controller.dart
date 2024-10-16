import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../constants/widget/Snackbar.dart';
import '../model/music_model.dart';
import '../utils/connection_check/connectivity_service.dart';

class MusicController with ChangeNotifier {
  final ApiService apiService = ApiService();
  MusicModel? _member;
  var isLoading = false.obs;
  String? _error;
  MusicModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> music(
    BuildContext context,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();
    try {
      _member = await apiService.music();
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
