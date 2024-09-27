import 'package:devotee/constants/widget/dialogs.dart';
import 'package:devotee/model/collaborate_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class CollaborateController with ChangeNotifier {
  final ApiService apiService = ApiService();
  CollaborateModel? _member;
  var isLoading = false.obs;
  String? _error;
  CollaborateModel? get member => _member;
  String? get error => _error;

  Future<void> collaborate(
    BuildContext context,
    String name,String phoneno,String email,String city,String state
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Collaborate(name, phoneno, email, city, state);
       // ignore: use_build_context_synchronously
      Dialogs.showSnackbarPop(context, '${member?.message}');

    } catch (e) {
      _error = e.toString();
      print(_error);

       Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
