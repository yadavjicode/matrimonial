import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/complaint_controller.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:devotee/utils/validation.dart';
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
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  @override
  void dispose() {
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
                        SizedBox(
                          width: double.infinity,
                          child: Image.asset("assets/images/complaint.png",
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              DrawerCommanCode()
                                  .buildTextBold("Hare Krishna!\n"),
                              DrawerCommanCode().buildText(
                                  "If you are facing any payment related problem or any technical problem, you can inform the same to us:\n"),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: name,
                                labelText: "Your Name",
                                hintText: "Enter name",
                                borderRadius: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      controller: phone,
                                      labelText: "Phone No.",
                                      hintText: "Enter phone no.",
                                      maxlength: 15,
                                      keyboardType: TextInputType.phone,
                                      borderRadius: 5,
                                      validator: (value) {
                                        return Validation.internationPhoneNo(
                                            value);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: email,
                                      labelText: "Email ID",
                                      hintText: "Enter email ID",
                                      borderRadius: 5,
                                      validator: (value) {
                                        return Validation.validateEmail(value);
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: complaint,
                                labelText: "Complaint",
                                maxline: 7,
                                borderRadius: 5,
                                hintText: "Please your Complaint",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Complaint';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
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
                                          complaintController.complaint(
                                              context,
                                              name.text.toString().trim(),
                                              phone.text.toString().trim(),
                                              email.text.toString().trim(),
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
              const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
  }
}
