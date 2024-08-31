import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/constants/color_constant.dart';
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
    String id,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Accepted(id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.primaryColor,
        content: Text(
          '${member?.status}',
          style: TextStyle(color: AppColors.constColor),
        ),
      ));
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
     Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
