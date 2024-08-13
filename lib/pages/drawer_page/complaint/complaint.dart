import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/complaint_controller.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ComplaintController complaintController =
      Get.put(ComplaintController());
  final TextEditingController complaint = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    complaint.clear();
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
            "Complaint",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
        ),
        body: Obx(() {
          return Stack(children: [
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
                          child: Image.asset("assets/images/complaint.png",
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
                                  "If you are facing any payment related problem or any technical problem, you can inform the same to us:\n"),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: complaint,
                                labelText: "Complaint",
                                maxline: 7,
                                borderRadius: 5,
                                hintText: "Please enter Complaint",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Complaint';
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
                                          complaintController.complaint(context,
                                              complaint.text.toString().trim()),
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
                    ),
                  ),
                )
              ],
            ),
            if (complaintController.isLoading.value)
              Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
  }
}
