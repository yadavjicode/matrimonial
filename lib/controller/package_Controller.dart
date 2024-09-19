import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/package_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class PackageController with ChangeNotifier {
  final ApiService apiService = ApiService();
  PackageModel? _member;
  var isLoading = false.obs;
  String? _error;
  PackageModel? get member => _member;
  String? get error => _error;

  Future<void> package(
    BuildContext context
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Package();
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
