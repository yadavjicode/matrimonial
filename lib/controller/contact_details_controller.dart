import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/contact_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class ContactDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ContactDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  ContactDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController=Get.put(FlowController());

  Future<void> contactDetails(BuildContext context, String mobileno,
      String email, String instaid) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.contactDetails(mobileno, email, instaid);
      flowController.Flow(context, 3);
      // Get.toNamed('/location');
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
