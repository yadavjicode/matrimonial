import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/accepted_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class AcceptedController with ChangeNotifier {
  final ApiService apiService = ApiService();
  AcceptedModel? _member;
  var isLoading = false.obs;
  String? _error;
  AcceptedModel? get member => _member;
  String? get error => _error;

  Future<void> accepted(
    BuildContext context,
    String id, {
    VoidCallback? btnOkOnPress,
  }) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Accepted(id);
      CustomDialog.show(
        context,
        'Accepted',
        '${member!.message}',
        dialogType: DialogType.success,
        btnOkOnPress: btnOkOnPress ??
            () {
              // Navigator.of(context).pop(); // Default action if none is provided
            },
      );
    } catch (e) {
      _error = e.toString();
      print(_error);
      CustomDialog.show(
        context,
        'Error',
        '${_error}',
        dialogType: DialogType.error,
      );
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
