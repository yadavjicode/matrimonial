import 'package:devotee/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/login_controller.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final LoginController _loginController = Get.put(LoginController());
  final TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 90, bottom: 20),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/lock.png",
                            height: 124,
                            width: 94,
                          )),
                      Center(
                        child: Text(
                          'Login With Email ID',
                          style: FontConstant.styleRegular(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: email,
                              validator: (value) {
                                return Validation.validateEmail(value);
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
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
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 12),
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
                              _loginController.login(context,
                                  email.text.toString().trim(), "email");
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
                ],
              ),
            ),
            if (_loginController.isLoading.value)
              const Center(
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
