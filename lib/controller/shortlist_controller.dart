// ignore_for_file: use_build_context_synchronously
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/shortlist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class ShortlistController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ShortlistModel? _member;
  var isLoading = false.obs;
  String? _error;
  ShortlistModel? get member => _member;
  String? get error => _error;

  Future<void> shortlist(
    BuildContext context,
    String id,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Shortlist(id);
       CustomDialog.show(
                  context,
                  'Shortlist',
                  '${member!.message}',
                  dialogType:DialogType.success,
                 
                );
    } catch (e) {
      _error = e.toString();
      print(_error);
      // Show error message using ScaffoldMessenger
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: Colors.grey.shade200,
      //   content: Text(
      //     '${_error}',
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ));
       CustomDialog.show(
                  context,
                  'error',
                  "${_error}",
                  dialogType:DialogType.error,
                 
                );
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
