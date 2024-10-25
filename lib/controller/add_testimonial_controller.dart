import 'package:devotee/controller/testimonial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../constants/widget/Snackbar.dart';
import '../model/add_testimonial_model.dart';
import '../utils/connection_check/connectivity_service.dart';

class AddTestimonialController with ChangeNotifier {
  final ApiService apiService = ApiService();
  AddTestimonialModel? _member;
  var isLoading = false.obs;
  String? _error;
  AddTestimonialModel? get member => _member;
  String? get error => _error;
  final TestimonialController testimonialController =
      Get.put(TestimonialController());

  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  Future<void> addTestimonial(
      BuildContext context, double rating, String desc) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.addTestimonial(rating, desc);
      // ignore: use_build_context_synchronously
      testimonialController.testimonial(context);
      Dialogs.showSnackbarPop(context, "${member?.message}");
      // ignore: use_build_context_synchronously
    } catch (e) {
      _error = e.toString();
      print(_error);
      if (!connectivityService.isConnected.value) {
        Dialogs.showSnackbar(context, "No internet connection!");
      } else {
        Dialogs.showSnackbar(context,
            "Something went wrong while fetching data. Please try again later!");
      }
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
