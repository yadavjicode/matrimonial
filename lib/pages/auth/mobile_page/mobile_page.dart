import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:devotee/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/login_controller.dart';
import '../../../constants/custom_dropdown.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  final LoginController _loginController = Get.put(LoginController());
  final CountryCodeController countryCodeController =
      Get.put(CountryCodeController());
  final TextEditingController mobileno = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? seletedCountryCode = "+91";
  bool? show;

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
                  // Positioned(
                  //   top: screenHeight * 0.15,
                  //   left: screenWidth * 0.4,
                  //   child: Image.asset('assets/images/lock.png', scale: 1.2),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 90, bottom: 20),
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/lock.png",
                              height: 124,
                              width: 94,
                            )),
                        Center(
                          child: Text(
                            'Login With Mobile Number',
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: Obx(() {
                                    if (countryCodeController.isLoading.value) {
                                      return buildDropdownWithSearch(
                                        "",
                                        ['Loading...'],
                                        (value) {
                                          setState(() {
                                            seletedCountryCode = null;
                                          });
                                        },
                                        selectedItem: 'Loading...',
                                        hintText: '+00',
                                      );
                                    } else {
                                      return buildDropdownWithSearch(
                                        "",
                                        countryCodeController
                                            .getCountryCodeList(),
                                        (value) {
                                          setState(() {
                                            seletedCountryCode = value;
                                          });
                                        },
                                        selectedItem: seletedCountryCode,
                                        borderColor: show == true &&
                                                seletedCountryCode == null
                                            ? Colors.red
                                            : Colors.black.withOpacity(0.5),
                                        errorMessage: "Country Code",
                                        errorshow: show == true &&
                                                seletedCountryCode == null
                                            ? true
                                            : false,
                                        hintText: '+00',
                                      );
                                    }
                                  }),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: CustomTextField(
                                    controller: mobileno,
                                    maxlength: 15,
                                    hintText: "Enter Your Mobile Number",
                                    validator: (value) {
                                      return Validation.internationPhoneNo(
                                          value);
                                    },
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 34.0),
                          child: CustomButton(
                            text: 'SEND OTP',
                            onPressed: () {
                              setState(() {
                                show = true;
                              });
                              if (seletedCountryCode != null &&
                                  _formKey.currentState!.validate()) {
                                String code = CommanClass()
                                    .removePlusSign(seletedCountryCode ?? "");
                                String phoneNo =
                                    mobileno.text.toString().trim();
                                _loginController.login(
                                    context, "$code$phoneNo", "mobile");
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
