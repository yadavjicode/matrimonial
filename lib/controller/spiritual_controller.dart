import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/education_details_model.dart';
import 'package:devotee/model/professional_details_model.dart';
import 'package:devotee/model/spiritual_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class SpiritualDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SpiritualDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  SpiritualDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController = Get.put(FlowController());

  Future<void> spiritualDetails(
      BuildContext context,
      String nameCounselor,
      String connectCounselor,
      String templeCounselor,
      String stateCounselor,
      String cityCounselor,
      String somethingCounselor) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.spiritualDetails(
          nameCounselor,
          connectCounselor,
          templeCounselor,
          stateCounselor,
          cityCounselor,
          somethingCounselor);

      flowController.Flow(context, 8);
      // Get.toNamed('/family');
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
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
