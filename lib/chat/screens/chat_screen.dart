import 'dart:developer';
import 'dart:io';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/widget/Snackbar.dart';
import '../api/apis.dart';
import '../helper/my_date_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_user.dart';
import '../models/message.dart';
import '../widgets/message_card.dart';
import '../../constants/widget/profile_image.dart';
import 'view_profile_screen.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;
  final bool block;
  const ChatScreen({super.key, required this.user, required this.block});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //for storing all messages
  List<Message> _list = [];
  DocumentSnapshot? _lastDocument;
  bool _hasMore = true; // To track if there are more messages to load
  bool _isLoadingMore = false; // To track if more messages are being loaded

  //for handling message text changes
  final _textController = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    APIs.getSelfInfo();

    _loadMessages(); // Load initial messages

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _hasMore) {
        _loadMoreMessages(); // Load more messages when scrolled to top
      }
    });

    SystemChannels.lifecycle.setMessageHandler((message) {
      log('Message: $message');

      if (APIs.myid != null) {
        if (message.toString().contains('resume')) {
          APIs.updateActiveStatus(true);
        }
        if (message.toString().contains('pause')) {
          APIs.updateActiveStatus(false);
        }
      }
      return Future.value(message);
    });
  }

  void _loadMessages() {
    APIs.getAllMessagesStream(widget.user, null).listen((snapshot) {
      setState(() {
        _list = snapshot.docs
            .map((doc) => Message.fromJson(doc.data() as Map<String, dynamic>))
            .where((message) => !message.deletedBy.contains(APIs.myid))
            .toList();

        if (snapshot.docs.isNotEmpty) {
          _lastDocument = snapshot.docs.last; // Save the last document snapshot
        }
      });
    });
  }

  void _loadMoreMessages() {
    if (_lastDocument != null) {
      setState(() {
        _isLoadingMore = true; // Set loading state to true
      });
      APIs.getAllMessagesStream(widget.user, _lastDocument).listen((snapshot) {
        setState(() {
          final newMessages = snapshot.docs
              .map(
                  (doc) => Message.fromJson(doc.data() as Map<String, dynamic>))
              .where((message) => !message.deletedBy.contains(APIs.myid))
              .toList();

          if (newMessages.isNotEmpty) {
            _list.addAll(newMessages);
            _lastDocument = snapshot.docs.isNotEmpty
                ? snapshot.docs.last
                : null; // Update the last document snapshot
          } else {
            _hasMore = false; // No more messages to load
          }
          _isLoadingMore = false;
        });
      });
    }
  }

  //showEmoji -- for storing value of showing or hiding emoji
  //isUploading -- for checking if image is uploading or not?
  bool _showEmoji = false, _isUploading = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      // child: PopScope(
      // onWillPop: () {
      //   if (_showEmoji) {
      //     setState(() => _showEmoji = !_showEmoji);
      //     return Future.value(false);
      //   } else {
      //     return Future.value(true);
      //   }
      // },

      //if emojis are shown & back button is pressed then hide emojis
      //or else simple close current screen on back button click
      // canPop: false,

      // onPopInvoked: (_) {
      //   if (_showEmoji) {
      //     setState(() => _showEmoji = !_showEmoji);
      //     return;
      //   }

      //   // some delay before pop
      //   Future.delayed(const Duration(milliseconds: 300), () {
      //     try {
      //       if (Navigator.canPop(context)) Navigator.pop(context);
      //     } catch (e) {
      //       log('ErrorPop: $e');
      //     }
      //   });
      // },

      //
      child: Scaffold(
        //app bar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(context, widget.block),
        ),

        backgroundColor: AppColors.background,

        //body
        body: Stack(children: [
          Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/background.png")),
          SafeArea(
            child: Stack(children: [
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _scrollController,
                      itemCount: _list.length,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final currentMessage = _list[index];
                        final previousMessage =
                            index < _list.length - 1 ? _list[index + 1] : null;
                        return MessageCard(
                          message: currentMessage,
                          previousMessage: previousMessage,
                        );
                      },
                    ),
                  ),

                  //progress indicator for showing uploading
                  if (_isUploading)
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: CircularProgressIndicator(strokeWidth: 2))),

                  //chat input filed
                  _chatInput(context, widget.block),

                  //show emojis on keyboard emoji button click & vice versa
                  if (_showEmoji)
                    SizedBox(
                      height: screenHeight * .35,
                      child: EmojiPicker(
                        textEditingController: _textController,
                        config: const Config(),
                      ),
                    )
                ],
              ),
              if (_isLoadingMore)
                Positioned(
                  top: 2,
                  left: 0,
                  right: 0,
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Loading ......",
                        style: FontConstant.styleRegular(
                            fontSize: 12, color: AppColors.darkgrey),
                      )),
                ),
            ]),
          ),
        ]),
      ),
      // ),
    );
  }

  String _getStatusMessage(ChatUser user) {
    if (user.isOnline && user.onlineStatus == 0) {
      return 'Online';
    } else if (user.lastActiveStatus == 0) {
      return MyDateUtil.getLastActiveTime(
        context: context,
        lastActive: user.lastActive,
      );
    } else {
      return ''; // If no valid status or last active time, return empty
    }
  }

  // app bar widget
  Widget _appBar(BuildContext context, bool block) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ViewProfileScreen(user: widget.user)));
          },
          child: StreamBuilder(
              stream: APIs.getUserInfo(widget.user),
              builder: (context, snapshot) {
                final data = snapshot.data?.docs;
                final list =
                    data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
                        [];

                return Row(
                  children: [
                    //back button
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back,
                            color: AppColors.constColor)),

                    //user profile picture
                    ProfileImage(
                      size: screenHeight * .05,
                      url: list.isNotEmpty ? list[0].image : widget.user.image,
                    ),

                    //for adding some space
                    const SizedBox(width: 10),

                    //user name & last seen time
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //user name
                        Text(list.isNotEmpty ? list[0].name : widget.user.name,
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.constColor,
                                fontWeight: FontWeight.w500)),

                        //for adding some space
                        const SizedBox(height: 2),

                        //last seen time of user
                        if (!block)
                          Text(
                            list.isNotEmpty
                                ? _getStatusMessage(list[
                                    0]) // Method to determine the status message
                                : _getStatusMessage(widget
                                    .user), // Fallback to the widget's user data
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.constColor,
                            ),
                          ),
                      ],
                    )
                  ],
                );
              })),
    );
  }

  // bottom chat input field
  Widget _chatInput(BuildContext context, bool block) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return !block
        ? Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * .01, horizontal: screenWidth * .025),
            child: Row(
              children: [
                //input field & buttons
                Expanded(
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      children: [
                        //emoji button
                        IconButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              setState(() => _showEmoji = !_showEmoji);
                            },
                            icon: const Icon(Icons.emoji_emotions,
                                color: AppColors.primaryColor, size: 25)),

                        Expanded(
                            child: TextField(
                          controller: _textController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onTap: () {
                            if (_showEmoji)
                              setState(() => _showEmoji = !_showEmoji);
                          },
                          decoration: const InputDecoration(
                              hintText: 'Type Something...',
                              hintStyle:
                                  TextStyle(color: AppColors.primaryColor),
                              border: InputBorder.none),
                        )),

                        //pick image from gallery button
                        IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();

                              // Picking multiple images
                              final List<XFile> images =
                                  await picker.pickMultiImage(imageQuality: 70);

                              // uploading & sending image one by one
                              for (var i in images) {
                                log('Image Path: ${i.path}');
                                setState(() => _isUploading = true);
                                await APIs.sendChatImage(
                                    widget.user, File(i.path));
                                setState(() => _isUploading = false);
                              }
                            },
                            icon: const Icon(Icons.image,
                                color: AppColors.primaryColor, size: 26)),

                        //take image from camera button
                        IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();

                              // Pick an image
                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.camera, imageQuality: 70);
                              if (image != null) {
                                log('Image Path: ${image.path}');
                                setState(() => _isUploading = true);

                                await APIs.sendChatImage(
                                    widget.user, File(image.path));
                                setState(() => _isUploading = false);
                              }
                            },
                            icon: const Icon(Icons.camera_alt_rounded,
                                color: AppColors.primaryColor, size: 26)),

                        //adding some space
                        SizedBox(width: screenWidth * .02),
                      ],
                    ),
                  ),
                ),
                //send message button
                MaterialButton(
                  onPressed: () async {
                    bool blocked = await APIs.isBlocked(widget.user.id);
                    if (!blocked) {
                      if (_textController.text.isNotEmpty) {
                        if (_list.isEmpty) {
                          //on first message (add user to my_user collection of chat user)
                          APIs.sendFirstMessage(
                              widget.user, _textController.text, Type.text);
                        } else {
                          //simply send message

                          APIs.sendMessage(
                              widget.user, _textController.text, Type.text);
                        }
                        _textController.text = '';
                      }
                    } else {
                      Dialogs.showSnackbar(
                          context, "You cannot chat with this user.");
                    }
                  },
                  minWidth: 0,
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 5, left: 10),
                  shape: const CircleBorder(),
                  color: AppColors.primaryColor,
                  child: const Icon(Icons.send, color: Colors.white, size: 28),
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Conversation is blocked.",
                style: FontConstant.styleMedium(
                    fontSize: 15, color: AppColors.darkgrey)),
          );
  }
}
