import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/models/chat_user.dart';
import 'package:devotee/chat/screens/home_screen.dart';
import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatLoginScreen extends StatefulWidget {
  const ChatLoginScreen({super.key});

  @override
  State<ChatLoginScreen> createState() => _ChatLoginScreenState();
}

class _ChatLoginScreenState extends State<ChatLoginScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  EditProfileController editProfileController =
      Get.put(EditProfileController());
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  void login() async {
    if (editProfileController.member!.member?.matriID != null) {
      // log('\nUser: ${user.user}');
      // log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

      if (await APIs.userExists() && mounted) {
        editProfileController.userDetails(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        editProfileController.userDetails(context);
        await APIs.createUser().then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('${editProfileController.member!.member?.matriID}'),
            CustomTextField(
              controller: idController,
              labelText: "Id",
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomTextField(
                controller: nameController,
                labelText: "Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomButton(
                  text: "login",
                  onPressed: () => {login()},
                  color: AppColors.primaryColor,
                  textStyle: FontConstant.styleSemiBold(
                      fontSize: 13, color: AppColors.constColor)),
            )
          ],
        ),
      ),
    );
  }
}
