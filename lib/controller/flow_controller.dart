import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/user_model.dart';
import 'package:devotee/utils/flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../utils/connection_check/connectivity_service.dart';

class FlowController with ChangeNotifier {
  final ApiService apiService = ApiService();
  UserModel? _member;
  var isLoading = false.obs;
  String? _error;
  UserModel? get member => _member;
  String? get error => _error;
  final Flows flow = Get.find<Flows>();
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> Flow(BuildContext context, int screenValue) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.userDetails();
      if (_member != null && _member!.member != null) {
        
        if (_member!.member!.accountType == 1) {
          List<int> steps = [
            _member!.member!.step1,
            _member!.member!.step2,
            _member!.member!.step3,
            _member!.member!.step4,
            _member!.member!.step5,
            _member!.member!.step6,
            _member!.member!.step7,
            _member!.member!.step8,
            _member!.member!.step9,
            _member!.member!.step10,
            _member!.member!.step11,
            _member!.member!.step12,
            _member!.member!.step13,
            _member!.member!.step14,
          ];
          if (steps.isNotEmpty) {
            Flows.navigateToNextStep(context, steps, screenValue);
          }
        } else {
          List<int> steps = [
            _member!.member!.step1,
            _member!.member!.step2,
            _member!.member!.step3,
            _member!.member!.step4,
            _member!.member!.step5,
            _member!.member!.step6,
            _member!.member!.step7,
            _member!.member!.step8,
            _member!.member!.step9,
            _member!.member!.step10,
            _member!.member!.step11,
            _member!.member!.step12,
            1,
            1
          ];
          if (steps.isNotEmpty) {
            Flows.navigateToNextStep(context, steps, screenValue);
          }
        }
      }
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
