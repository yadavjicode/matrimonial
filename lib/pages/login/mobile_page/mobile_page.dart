import 'package:devotee/pages/login/otp_page/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/login_controller.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    String? validateInput(String? value) {
      final phoneRegExp = RegExp(r'^\+?1?\d{10,10}$');
      final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');

      if (value == null || value.isEmpty) {
        return 'Please enter a phone number or email address';
      } else if (!phoneRegExp.hasMatch(value) && !emailRegExp.hasMatch(value)) {
        return 'Please enter a valid phone number or email address';
      }

      return null;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Login Into Account',
          style: FontConstant.styleSemiBold(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
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
                    top: screenHeight * 0.15,
                    left: screenWidth * 0.4,
                    child: Image.asset('assets/images/lock.png', scale: 1.5),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Enter Mobile Number or Email ID',
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _loginController.mobileno,
                                validator: validateInput,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(23),
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34.0),
                          child: CustomButton(
                            text: 'SEND OTP',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _loginController.login(context);
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
                ],
              ),
            ),
            if (_loginController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ],
        );
      }),
    );
  }
}
