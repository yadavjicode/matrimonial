import 'package:get/get.dart';
import '../api/apis.dart';


class UnreadMessageController extends GetxController {
  var unreadCounts = <String, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _listenForUnreadMessages();
  }

  void _listenForUnreadMessages() {
    APIs.getMyUsersId().listen((snapshot) {
      final userIds = snapshot.docs.map((e) => e.id).toList();
      _updateUnreadCounts(userIds);
    });
  }

  void _updateUnreadCounts(List<String> userIds) {
    for (var userId in userIds) {
      APIs.getUnreadMessagesCount(userId).then((count) {
        unreadCounts[userId] = count;
      });
    }
  }

  int getUnreadCount(String userId) {
    return unreadCounts[userId] ?? 0;
  }
}
