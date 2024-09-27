import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/apis.dart';
import '../helper/my_date_util.dart';
import '../models/chat_user.dart';
import '../models/message.dart';
import '../screens/chat_screen.dart';
import 'dialogs/profile_dialog.dart';
import '../../constants/widget/profile_image.dart';

//card to represent a single user in home screen
class ChatUserCard extends StatefulWidget {
  final ChatUser user;

  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  //last message info (if null --> no message)
  Message? _message;
  String? count;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * .04, vertical: 4),
      // color: Colors.blue.shade100,
      elevation: 0.5,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: () {
            //for navigating to chat screen
            if (userProfileController.member?.member?.accountType == 1  ) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatScreen(user: widget.user)));
            } else {
              Dialogs.showSnackbarPack(context, 'chat feature');
            }
          },
          child: StreamBuilder(
            stream: APIs.getLastMessage(widget.user),
            builder: (context, snapshot) {
              final data = snapshot.data?.docs;
              final list =
                  data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
              if (list.isNotEmpty) _message = list[0];

              return ListTile(
                //user profile picture
                leading: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => ProfileDialog(user: widget.user));
                  },
                  child: Stack(children: [
                    ProfileImage(
                        size: screenHeight * .055, url: widget.user.image),
                    if (userProfileController.member?.member?.accountType == 1)
                      onlineStatus(),
                  ]),
                ),

                //user name
                title: Text(widget.user.name),

                //last message
                subtitle: Text(
                    _message != null &&
                            userProfileController.member?.member?.accountType ==
                                1
                        ? _message!.type == Type.image
                            ? 'image'
                            : _message!.msg
                        : widget.user.about,
                    style: _message == null ||
                            userProfileController.member?.member?.accountType !=
                                1
                        ? const TextStyle(color: AppColors.darkgrey)
                        : _message!.read.isEmpty &&
                                _message!.fromId != APIs.myid
                            ? const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold)
                            : const TextStyle(color: AppColors.darkgrey),
                    maxLines: 1),

                //last message time
                trailing: _message == null
                    ? null //show nothing when no message is sent
                    : _message!.read.isEmpty && _message!.fromId != APIs.myid
                        ?
                        //show for unread message
                        SizedBox(
                            width: 15,
                            height: 15,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  border: Border.all(
                                      color: AppColors.background, width: 2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                            ),
                          )
                        :
                        //message sent time
                        Text(
                            MyDateUtil.getLastMessageTime(
                                context: context, time: _message!.sent),
                            style: const TextStyle(color: AppColors.darkgrey),
                          ),
              );
            },
          )),
    );
  }

  Widget onlineStatus() {
    if (widget.user.isOnline && widget.user.onlineStatus == 0) {
      return Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            width: 12,
            height: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 230, 119),
                  border: Border.all(color: AppColors.constColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
          ));
    } else if (widget.user.lastActiveStatus == 0) {
      return Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            width: 12,
            height: 12,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 192, 189, 189),
                  border: Border.all(color: AppColors.constColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
          ));
    } else {
      return const Text("");
    }
  }
}
