// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/coupons_model.dart';
import 'package:devotee/model/shortlist_model.dart';
import 'package:devotee/model/shortlisted_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class CouponsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  CouponModel? _member;
  var isLoading = false.obs;
  String? _error;
  CouponModel? get member => _member;
  String? get error => _error;

  Future<void> coupons(
    BuildContext context
    
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Coupons();
      //  CustomDialog.show(
      //             context,
      //             'Shortlist',
      //             '${member!.message}',
      //             dialogType:DialogType.success,
                 
      //           );
    } catch (e) {
      _error = e.toString();
      print(_error);
       CustomDialog.show(
                  context,
                  'error',
                  "${_error}",
                  dialogType:DialogType.error,
                 
                );
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
