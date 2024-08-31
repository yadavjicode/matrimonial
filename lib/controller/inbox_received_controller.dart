import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/model/inbox_received_model.dart';
import 'package:devotee/model/inbox_sent_model.dart';
import 'package:devotee/model/profile_details_model.dart';
import 'package:devotee/model/search_model.dart';
import 'package:devotee/model/sent_invitation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class InboxReceivedController with ChangeNotifier {
  final ApiService apiService = ApiService();
  InboxReceivedModel? _member;
  var isLoading = false.obs;
  String? _error;
  InboxReceivedModel? get member => _member;
  String? get error => _error;

  Future<void> inboxSent(
    BuildContext context,
    String status,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.InboxReceived(status);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColors.primaryColor,
      //   content: Text(
      //     '${member?.message}',
      //     style: TextStyle(color: AppColors.constColor),
      //   ),
      // ));
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
