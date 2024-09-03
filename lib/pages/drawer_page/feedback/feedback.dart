import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/feedback_controller.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FeedbackController feedbackController = Get.put(FeedbackController());
  final TextEditingController feedback = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    feedback.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Feedback",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                      width: double.infinity,
                      alignment: Alignment.topRight,
                      child: Image.asset("assets/images/bg3.png")),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.asset("assets/images/feedback.png",
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                DrawerCommanCode()
                                    .buildTextBold("Hare Krishna!\n"),
                                DrawerCommanCode().buildText(
                                    "We love to hear from you about our Genuine Efforts. If you liked our work then please give us a feedback here. Your comments will be public and can be read by everyone\n"),
                                CustomTextField(
                                  controller: feedback,
                                  maxline: 7,
                                  borderRadius: 5,
                                  hintText: "Write your feedback",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Feedback';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: CustomDrawerButton(
                                      color: AppColors.primaryColor,
                                      text: "SUBMIT",
                                      onPressed: () => {
                                        if (_formKey.currentState!.validate())
                                          {
                                            feedbackController.feedback(context,
                                                feedback.text.toString().trim())
                                          }
                                      },
                                      textStyle: FontConstant.styleRegular(
                                          fontSize: 14,
                                          color: AppColors.constColor),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            if (feedbackController.isLoading.value)
              Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
  }
}
