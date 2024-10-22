import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/controller/contact_details_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../controller/edit_profile_controller.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({Key? key})
      : super(key: key); // Fix: Added key parameter

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController instaController = TextEditingController();
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final ContactDetailsController _contactDetailController =
      Get.put(ContactDetailsController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((_) {
        setState(() {
          phonecontroller.text =
              _editProfileController.member?.member?.mobile ?? "";
          emailController.text =
              _editProfileController.member?.member?.confirmEmail ?? "";
          instaController.text =
              _editProfileController.member?.member?.instagramId ?? "";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/profile2');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            SingleChildScrollView(
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
                          CustomTextField(
                            labelText: "Phone number*",
                            hintText: "Enter Phone Number",
                            controller: phonecontroller,
                            keyboardType: TextInputType.phone,
                            maxlength: 15,
                            validator: (value) {
                              return Validation.internationPhoneNo(value);
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            labelText: "Email address*",
                            hintText: "Enter Email address",
                            controller: emailController,
                            validator: (value) {
                              return Validation.validateEmail(value);
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomTextField(
                            labelText: "Instagram ID",
                            hintText: "Enter Instagram ID",
                            controller: instaController,
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: CustomButton(
                              text: 'CONTINUE',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  _contactDetailController.contactDetails(
                                      context,
                                      phonecontroller.text.toString().trim(),
                                      emailController.text.toString().trim(),
                                      instaController.text.toString().trim(),
                                      false);

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
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_contactDetailController.isLoading.value ||
                _editProfileController.isLoading.value ||
                flowController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
