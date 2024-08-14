import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/suggestion_controller.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({super.key});

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  final TextEditingController suggestion=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SuggestionController suggestionController =Get.put(SuggestionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Suggestion",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body:Obx(() {
          return Stack(
        children: [
         Stack(
          children: [
            Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/bg3.png")),
            SingleChildScrollView(
              child: Form(
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
                          DrawerCommanCode().buildTextBold("Hare Krishna!\n"),
                          DrawerCommanCode().buildText(
                              "There is always a scope of Improvement, so the same is applicable with this application as well, you can share your suggestion here to have some improvement in our application\n"),
                          
                          CustomTextField(
                            controller: suggestion,
                            labelText: "Suggestion",
                            maxline: 7,
                            borderRadius: 5,
                             hintText: "Write your suggestion",
                             validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter suggestion';
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
                                                suggestionController.suggestion(context,
                                                    suggestion.text.toString().trim())
                                              }
                                          },
                                textStyle: FontConstant.styleRegular(
                                    fontSize: 14, color: AppColors.constColor),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
         if (suggestionController.isLoading.value)
              Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
        ]
      );
      
      }
      )
    );
  }
}
