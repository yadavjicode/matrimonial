import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/buy_package_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../constants/widget/Snackbar.dart';
import '../utils/connection_check/connectivity_service.dart';
import 'flow_controller.dart';

class BuyPackageController with ChangeNotifier {
  final ApiService apiService = ApiService();
  BuyPackageModel? _member;
  var isLoading = false.obs;
  String? _error;
  BuyPackageModel? get member => _member;
  String? get error => _error;
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());
  final FlowController flowController = Get.put(FlowController());

  Future<void> buyPackage(BuildContext context, bool check) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.BuyPackage();

      // ignore: use_build_context_synchronously
      CustomDialog.show(
        context,
        '${member!.title}',
        '${member!.message}',
        dialogType: DialogType.success,
        btnOkOnPress: () => {
          editProfileController.userDetails(context),
          if (check)
            {flowController.Flow(context, 12)}
          else
            {flowController.Flow(context, 12)}
        },
      );
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
