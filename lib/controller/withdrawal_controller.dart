import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/accepted_model.dart';
import 'package:devotee/model/withdrawal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class WithdrawalController with ChangeNotifier {
  final ApiService apiService = ApiService();
  WithDrawalModel? _member;
  var isLoading = false.obs;
  String? _error;
  WithDrawalModel? get member => _member;
  String? get error => _error;

  Future<void> withdrawal(
    BuildContext context,
    String id,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Withdrawal(id);
       CustomDialog.show(
                  context,
                  'Withdrawal',
                  '${member!.message}',
                  dialogType:DialogType.success,
                 
                );
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
     CustomDialog.show(
                  context,
                  'Error',
                  '${_error}',
                  dialogType:DialogType.error,
                 
                );
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
