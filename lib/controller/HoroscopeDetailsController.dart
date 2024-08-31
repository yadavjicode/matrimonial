import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/education_details_model.dart';
import 'package:devotee/model/horoscope_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class HoroscopeDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  HoroscopeDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  HoroscopeDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController = Get.put(FlowController());

  Future<void> horoscopeDetails(BuildContext context, String timeHoroscope,
      String stateHoroscope, String cityHoroscope) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.horoscopeDetails(
          timeHoroscope, stateHoroscope, cityHoroscope);
      flowController.Flow(context, 11);
      // Get.toNamed('/profile');
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
