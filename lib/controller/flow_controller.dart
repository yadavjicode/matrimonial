import 'package:devotee/model/user_model.dart';
import 'package:devotee/utils/flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class FlowController with ChangeNotifier {
  final ApiService apiService = ApiService();
  UserModel? _member;
  var isLoading = false.obs;
  String? _error;
  UserModel? get member => _member;
  String? get error => _error;
  final Flows flow = Get.find<Flows>();

  Future<void> Flow(BuildContext context, int screenValue) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.userDetails();

      if (_member != null && _member!.member != null) {
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
        ];
        if (steps.isNotEmpty) {
          Flows.navigateToNextStep(context, steps, screenValue);
        }
      }
    } catch (e) {
      _error = e.toString();
      print(_error);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Text(
          '${_error}',
          style: TextStyle(color: Colors.black),
        ),
      ));
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}