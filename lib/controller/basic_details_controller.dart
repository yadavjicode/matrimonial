import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/basic_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class BasicDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  BasicDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  BasicDetailsModel? get member => _member;
  String? get error => _error;
 final FlowController flowController = Get.find<FlowController>();
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
    return monthMap[mon] ?? "Invalid month";
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
      String about) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.basicDetails(tittle, name, surname, spiritual,
          maritalStatus, height, weight, dob, hobbies, diet, about);
          print("vnrvnbrvn gooooooo");

      
      await flowController.Flow(context, 2); 
     

      // Get.toNamed('/contact');
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
