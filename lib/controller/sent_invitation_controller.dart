import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:devotee/constants/widget/custom_dailog.dart';
import 'package:devotee/model/sent_invitation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import '../chat/api/apis.dart';
import '../chat/api/direct_chat_controller.dart';
import '../chat/models/chat_user.dart';
import '../constants/widget/Snackbar.dart';
import '../constants/widget/dialog.dart';
import '../utils/connection_check/connectivity_service.dart';

class SentInvitationController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SentInvitationModel? _member;
  var isLoading = false.obs;
  String? _error;
  SentInvitationModel? get member => _member;
  String? get error => _error;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());
  final DirectChatController directChatController =
      Get.put(DirectChatController());

  Future<void> sentInvitation(
    BuildContext context,
    String id, {
    VoidCallback? btnOkOnPress, // Optional btnOkOnPress function
  }) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.SentInvitation(id);

      if (_member?.status == "true") {
        // ignore: use_build_context_synchronously
        ChatUser? user = await directChatController.getUserById(id);

        // ignore: use_build_context_synchronously
        CustomDialog.show(
          context,
          member?.message ?? "",
          member?.title ?? "",
          dialogType: DialogType.success,
          btnOkOnPress: btnOkOnPress ?? () {},
        );
        if (_member?.key == 1) {
          if (!directChatController.isLoading.value) {
            if (user != null) {
              if (user.pushToken.isNotEmpty) {
                print("user token ${user.pushToken}");
                APIs.sendPushNotification(
                    user, "The user has expressed interest in you");
              }
            }
          }
        }
      } else {
        DialogConstant.packageDialog(context, 'sent invitation feature');
      }
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
