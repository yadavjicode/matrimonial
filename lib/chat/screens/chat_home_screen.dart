import 'dart:developer';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/widget/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/widget/dialog.dart';
import '../../controller/edit_profile_controller.dart';
import '../api/apis.dart';
import '../../constants/widget/Snackbar.dart';
import '../models/chat_user.dart';
import '../widgets/chat_user_card.dart';
import '../../constants/widget/profile_image.dart';
import 'profile_screen.dart';

//home screen -- where all available contacts are shown
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final EditProfileController userProfileController =
      Get.put(EditProfileController());

  // for storing all users
  List<ChatUser> _list = [];

  // for storing searched items
  final List<ChatUser> _searchList = [];
  // for storing search status
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeData();
    });
  }

  void initializeData() async {
    APIs.getSelfInfo();
    await userProfileController.userDetails(context).then((_) {
      if (userProfileController.member?.member?.accountType != 1) {
        DialogConstant.packageDialog(context, 'chat feature');
      }
    });

    //for updating user active status according to lifecycle events
    //resume -- active or online
    //pause  -- inactive or offline
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //for hiding keyboard when a tap is detected on screen
      onTap: FocusScope.of(context).unfocus,
      // child: PopScope(
      // onWillPop: () {
      //   if (_isSearching) {
      //     setState(() {
      //       _isSearching = !_isSearching;
      //     });
      //     return Future.value(false);
      //   } else {
      //     return Future.value(true);
      //   }
      // },

      //if search is on & back button is pressed then close search
      //or else simple close current screen on back button click
      // canPop: false,
      // onPopInvoked: (_) {
      //   if (_isSearching) {
      //     setState(() => _isSearching = !_isSearching);
      //     return;
      //   }

      //   // some delay before pop
      //   Future.delayed(
      //       const Duration(milliseconds: 300), SystemNavigator.pop);
      // },

      //
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.background,
        //app bar
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          //view profile
          leading: IconButton(
            icon: SvgPicture.asset("assets/images/menu.svg"),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          //title
          title: _isSearching
              ? TextField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search......',
                      hintStyle: TextStyle(color: AppColors.constColor)),
                  autofocus: true,
                  style: const TextStyle(
                      fontSize: 17,
                      letterSpacing: 0.5,
                      color: AppColors.constColor),
                  //when search text changes then updated search list
                  onChanged: (val) {
                    //search logic
                    _searchList.clear();

                    val = val.toLowerCase();

                    for (var i in _list) {
                      if (i.name.toLowerCase().contains(val) ||
                          i.email.toLowerCase().contains(val)) {
                        _searchList.add(i);
                      }
                    }
                    setState(() => _searchList);
                  },
                )
              : const Text('My Chat'),

          actions: [
            IconButton(
              tooltip: 'View Profile',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProfileScreen(user: APIs.me)));
              },
              icon: ProfileImage(
                size: 40,
                url: APIs.me.image,
              ),
              padding: EdgeInsets.all(0),
            ),
            //search user button
            IconButton(
                tooltip: 'Search',
                onPressed: () => setState(() => _isSearching = !_isSearching),
                icon: Icon(_isSearching
                    ? CupertinoIcons.clear_circled_solid
                    : CupertinoIcons.search)),

            //add new user
            // IconButton(
            //     tooltip: 'Add User',
            //     padding: const EdgeInsets.only(right: 8),
            //     onPressed: _addChatUserDialog,
            //     icon: const Icon(CupertinoIcons.person_add, size: 25))
          ],
        ),

        //floating button to add AI Screen
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 10),
        //   child: FloatingActionButton(
        //       backgroundColor: Colors.white,
        //       onPressed: () {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (_) => const AiScreen()));
        //       },
        //       child: Lottie.asset('assets/lottie/ai.json', width: 40)),
        // ),

        //body
        body: Stack(children: [
          Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/background.png")),
          StreamBuilder(
            stream: APIs.getMyUsersId(),

            //get id of only known users
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                //if data is loading
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ));

                //if some or all data is loaded then show it
                case ConnectionState.active:
                case ConnectionState.done:
                  return StreamBuilder(
                    stream: APIs.getAllUsers(
                        snapshot.data?.docs.map((e) => e.id).toList() ?? []),

                    //get only those user, who's ids are provided
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        //if data is loading
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                        // return const Center(
                        //     child: CircularProgressIndicator());

                        //if some or all data is loaded then show it
                        case ConnectionState.active:
                        case ConnectionState.done:
                          final data = snapshot.data?.docs;
                          _list = data
                                  ?.map((e) => ChatUser.fromJson(e.data()))
                                  .toList() ??
                              [];

                          if (_list.isNotEmpty) {
                            return ListView.builder(
                                itemCount: _isSearching
                                    ? _searchList.length
                                    : _list.length,
                                padding: EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  print("hii");
                                  return ChatUserCard(
                                      user: _isSearching
                                          ? _searchList[index]
                                          : _list[index]);
                                });
                          } else {
                            return const Center(
                              child: Text('No user Found!',
                                  style: TextStyle(fontSize: 20)),
                            );
                          }
                      }
                    },
                  );
              }
            },
          ),
          // if (userProfileController.isLoading.value)
          //   Center(
          //       child: CircularProgressIndicator(
          //     color: AppColors.primaryColor,
          //   ))
        ]),
        drawer: CustomDrawer(scaffoldKey: scaffoldKey),
      ),
      // ),
    );
  }

  // for adding new chat user
  void _addChatUserDialog() {
    String email = '';
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.only(
                  left: 24, right: 24, top: 20, bottom: 10),

              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),

              //title
              title: const Row(
                children: [
                  Icon(
                    Icons.person_add,
                    color: Colors.blue,
                    size: 28,
                  ),
                  Text('  Add User')
                ],
              ),

              //content
              content: TextFormField(
                maxLines: null,
                onChanged: (value) => email = value,
                decoration: const InputDecoration(
                    hintText: 'User Id',
                    prefixIcon: Icon(Icons.email, color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
              ),

              //actions
              actions: [
                //cancel button
                MaterialButton(
                    onPressed: () {
                      //hide alert dialog
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.blue, fontSize: 16))),

                //add button
                MaterialButton(
                    onPressed: () async {
                      //hide alert dialog
                      Navigator.pop(context);
                      if (email.trim().isNotEmpty) {
                        await APIs.addChatUser(email).then((value) {
                          if (!value) {
                            Dialogs.showSnackbar(
                                context, 'User does not Exists!');
                          }
                        });
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ))
              ],
            ));
  }
}
