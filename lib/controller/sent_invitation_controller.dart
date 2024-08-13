import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/model/profile_details_model.dart';
import 'package:devotee/model/search_model.dart';
import 'package:devotee/model/sent_invitation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class SentInvitationController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SentInvitationModel? _member;
  var isLoading = false.obs;
  String? _error;
  SentInvitationModel? get member => _member;
  String? get error => _error;

  Future<void> sentInvitation(
    BuildContext context,
    String id,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.SentInvitation(id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.primaryColor,
        content: Text(
          '${member?.message}',
          style: TextStyle(color: AppColors.constColor),
        ),
      ));
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
