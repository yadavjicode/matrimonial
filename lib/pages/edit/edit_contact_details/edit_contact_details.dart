import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/controller/contact_details_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';

class EditContactDetails extends StatefulWidget {
  const EditContactDetails({Key? key})
      : super(key: key); // Fix: Added key parameter

  @override
  State<EditContactDetails> createState() => _EditContactDetailsState();
}

class _EditContactDetailsState extends State<EditContactDetails> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController instaController = TextEditingController();

  final ContactDetailsController _contactDetailController =
      Get.put(ContactDetailsController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((value) {
        setState(() {
          instaController.text =
              _editProfileController.member?.member?.instagramId ?? "";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Contact Details",
            style:
                FontConstant.styleSemiBold(fontSize: 18, color: Colors.white),
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            contactContent(),
            if (_contactDetailController.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget contactContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: screenHeight * 0.4,
            width: screenWidth,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg3.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: screenWidth * 0.35,
            right: screenWidth * 0.35,
            child: Image.asset('assets/images/contact.png'),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.2,
              left: 22,
              right: 22,
            ),
            child: Form(
              key: formKey, // Assign formKey here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  CustomTextField(
                    labelText: "Instagram ID",
                    controller: instaController,
                    hintText: "Enter Instagram ID",
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomButton(
                      text: 'CONTINUE',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _contactDetailController.contactDetails(
                              context,
                              _editProfileController.member!.member!.mobile,
                              _editProfileController
                                  .member!.member!.confirmEmail,
                              instaController.text.toString().trim(),
                              true);

                          //  Get.toNamed('/location');
                        }
                      },
                      color: AppColors.primaryColor,
                      textStyle: FontConstant.styleRegular(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
