import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/basic_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class BasicDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  BasicDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  BasicDetailsModel? get member => _member;
  String? get error => _error;
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());
  String getMonth(String mon) {
    Map<String, String> monthMap = {
      "Jan": "01",
      "Feb": "02",
      "Mar": "03",
      "Apr": "04",
      "May": "05",
      "Jun": "06",
      "Jul": "07",
      "Aug": "08",
      "Sep": "09",
      "Oct": "10",
      "Nov": "11",
      "Dec": "12"
    };

    // Convert the input to lowercase and get the corresponding month number
    return monthMap[mon] ?? "";
  }

  String getMonthString(String mon) {
    Map<String, String> monthMap = {
      "01": "Jan",
      "02": "Feb",
      "03": "Mar",
      "04": "Apr",
      "05": "May",
      "06": "Jun",
      "07": "Jul",
      "08": "Aug",
      "09": "Sep",
      "10": "Oct",
      "11": "Nov",
      "12": "Dec"
    };

    // Convert the input to lowercase and get the corresponding month number
    return monthMap[mon] ?? "";
  }

  Future<void> basicDetails(
      BuildContext context,
      String tittle,
      String name,
      String surname,
      String spiritual,
      String maritalStatus,
      String height,
      String weight,
      String dob,
      String hobbies,
      String diet,
      String about,
      bool status) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.basicDetails(tittle, name, surname, spiritual,
          maritalStatus, height, weight, dob, hobbies, diet, about);

      if (status) {
        _editProfileController.userDetails(context);
        Navigator.pop(context);
      } else {
        
        await flowController.Flow(context, 2);
      }

      // Get.toNamed('/contact');
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
