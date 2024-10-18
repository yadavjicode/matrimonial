import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';

import 'package:devotee/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

import '../../../controller/login_controller.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final OtpController _memberController = Get.put(OtpController());
  final LoginController _loginController = Get.put(LoginController());
  // final StateController stateController = Get.put(StateController());
  String otp = '';
  Telephony telephony = Telephony.instance;
  OtpFieldController otpbox = OtpFieldController();
  final Map<String, dynamic> arguments = Get.arguments;

  // TextEditingController otpboxa = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestSmsPermissions();
    // stateController.getStateList();
  }

  Future<void> _requestSmsPermissions() async {
    PermissionStatus smsPermission = await Permission.sms.request();

    if (smsPermission.isGranted) {
      _listenForSms();
    } else {
      print('SMS permission denied');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('SMS permission is required for OTP autofill')),
      );
    }
  }

  void _listenForSms() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print('Received SMS from: ${message.address}');
        print('Message body: ${message.body}');

        String sms = message.body ?? "";

        if (sms.contains('GO DIET Application')) {
          String otpCode = sms.replaceAll(RegExp(r'[^0-9]'), '');
          print('Extracted OTP: $otpCode'); // Debugging line
          otpbox.set(otpCode.split(""));
          setState(() {
            otp = otpCode;
          });
        } else {
          print("No relevant OTP found in message");
        }
      },
      listenInBackground: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String phoneEmail = arguments['phoneEmail'];
    final String go = arguments['go'];
    return Scaffold(
        backgroundColor: AppColors.primaryLight,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (go == "mobile") {
                Get.offAndToNamed('/mobile');
              } else if (go == "email") {
                Get.offAndToNamed('/email');
              }
            },
          ),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text('Verify Phone Number'),
        ),
        body: Obx(() {
          return Stack(children: [
            SingleChildScrollView(
              child: Stack(children: [
                Container(
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/background.png")),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 40),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/otp.png",
                            height: 150,
                            width: 200,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, bottom: 20),
                        child: Center(
                          child: Text(
                            'Code is sent to ${phoneEmail.substring(0, 2)}******${phoneEmail.substring(10, 12)}',
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 30, right: 30),
                        child: OTPTextField(
                          otpFieldStyle: OtpFieldStyle(
                              focusBorderColor: AppColors.primaryColor,
                              // enabledBorderColor: AppColors.primaryColor,

                              backgroundColor: AppColors.constColor),
                          outlineBorderRadius: 10,
                          controller: otpbox,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 50,
                          style: TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            otp = pin;
                            print("Completed: $otp");
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive OTP?",
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              _loginController.login(
                                  context, phoneEmail, go);
                            },
                            child: Text(
                              "Send Again",
                              style: FontConstant.styleRegular(
                                fontSize: 13,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Resend in 00:15',
                        style: FontConstant.styleRegular(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: CustomButton(
                          text: 'SUBMIT OTP',
                          onPressed: () {
                            //   login(widget.mobileNumber, otp);
                            if (otp.length == 4) {
                              // _otpControllers.otpfill(context,
                              //     otpbox.toString(), widget.mobileNumber);
                              _memberController.otp(
                                  phoneEmail, otp.toString(), context);

                              //   Get.toNamed('/profile1');
                            } else {
                              Dialogs.showSnackbar(
                                  context, "Please enter a valid 4-digit OTP");
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
              ]),
            ),
            if (_memberController.isLoading.value||_loginController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
