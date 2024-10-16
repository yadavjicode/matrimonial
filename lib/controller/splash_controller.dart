import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/user_model.dart';
import 'package:devotee/utils/flow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

import '../utils/connection_check/connectivity_service.dart';

class SplashController with ChangeNotifier {
  final ApiService apiService = ApiService();
  UserModel? _member;
  var isLoading = false.obs;
  String? _error;
  UserModel? get member => _member;
  String? get error => _error;
  final Flows flow=Get.put(Flows());
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());
      
  Future<void> userDetails(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.userDetails();
      int step1=member!.member!.step1;
      int step2=member!.member!.step2;
      int step3=member!.member!.step3;
      int step4=member!.member!.step4;
      int step5=member!.member!.step5;
      int step6=member!.member!.step6;
      int step7=member!.member!.step7;
      int step8=member!.member!.step8;
      int step9=member!.member!.step9;
      int step10=member!.member!.step10;
      int step11=member!.member!.step11;
      int step12=member!.member!.step12;

    
     Flows.navigateToNextStep(context, [
        step1, step2, step3, step4, step5, step6, 
        step7, step8, step9, step10, step11, step12
      ],0);
     
    


    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
     if (!connectivityService.isConnected.value) {
        Dialogs.showSnackbar(context, "No internet connection!");
      } else {
        Dialogs.showSnackbar(context, "Something went wrong while fetching data. Please try again later!");
      }
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
 

  
}
