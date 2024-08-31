import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/buy_package_model.dart';
import 'package:devotee/model/coupons_model.dart';
import 'package:devotee/model/package_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class BuyPackageController with ChangeNotifier {
  final ApiService apiService = ApiService();
  BuyPackageModel? _member;
  var isLoading = false.obs;
  String? _error;
  BuyPackageModel? get member => _member;
  String? get error => _error;
final EditProfileController editProfileController=Get.put(EditProfileController());
  Future<void> buyPackage(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.BuyPackage();
  
      // ignore: use_build_context_synchronously
      CustomDialog.show(
        context,
        '${member!.status}',
        '${member!.message}',
        dialogType: DialogType.success,
       btnOkOnPress: () => {
        editProfileController.userDetails(context),
        Get.toNamed("/package")
       },
      );
    } catch (e) {
      _error = e.toString();
      print(_error);
      CustomDialog.show(
        context,
        'error',
        "${_error}",
        dialogType: DialogType.error,
      );
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
