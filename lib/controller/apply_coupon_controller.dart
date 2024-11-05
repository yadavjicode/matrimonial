import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../constants/widget/Snackbar.dart';
import '../model/apply_coupon_model.dart';
import '../utils/connection_check/connectivity_service.dart';
import 'flow_controller.dart';

class ApplyCouponController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ApplyCouponModel? _member;
  var isLoading = false.obs;
  String? _error;
  ApplyCouponModel? get member => _member;
  String? get error => _error;
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());
  final FlowController flowController = Get.put(FlowController());

  Future<void> applyCoupon(BuildContext context, String coupon) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.applyCoupon(coupon);
      // ignore: use_build_context_synchronously
      Dialogs.showSnackbar(context, "${member?.message}");
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
