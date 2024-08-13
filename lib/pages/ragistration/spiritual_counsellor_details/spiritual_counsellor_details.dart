import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_checkbox.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/profile_constant.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:devotee/controller/spiritual_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SpiritualDetails extends StatefulWidget {
  const SpiritualDetails({super.key});

  @override
  State<SpiritualDetails> createState() => _SpiritualDetailsState();
}

class _SpiritualDetailsState extends State<SpiritualDetails> {
  StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  CityControllerPermanent cityControllerPermanent =
      Get.put(CityControllerPermanent());
  SpiritualDetailsController spiritualController =
      Get.put(SpiritualDetailsController());
  TextEditingController nameCounselor = TextEditingController();
  TextEditingController connectCounselor = TextEditingController();
  TextEditingController templeCounselor = TextEditingController();
  TextEditingController SomethingCounselor = TextEditingController();
  String? selectedState;
  String? selectedCity;
  int? counsellor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryLight,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Spiritual Counselor Details",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/devotion');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/background.png")),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 35, left: 22, right: 22, bottom: 100),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/spiritual.png",
                              height: 92,
                              width: 92,
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "I am connected with any Spirtual Counselor",
                          style: FontConstant.styleRegular(
                              fontSize: 16, color: AppColors.black),
                        ),
                        Row(
                          children: [
                            Radio(
                              activeColor: AppColors.primaryColor,
                              value: 1,
                              groupValue: counsellor,
                              onChanged: (value) => {
                                setState(() {
                                  counsellor = value!;
                                })
                              },
                            ),
                            Text(
                              "Yes",
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: AppColors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Radio(
                              activeColor: AppColors.primaryColor,
                              value: 2,
                              groupValue: counsellor,
                              onChanged: (value) => {
                                setState(() {
                                  counsellor = value!;
                                })
                              },
                            ),
                            Text(
                              "No",
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: AppColors.black),
                            )
                          ],
                        ),
                        if (counsellor == 1)
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText:
                                      "Name of the Counselor for my Spiritual Path",
                                  controller: nameCounselor,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText:
                                      "Connected with my Counselor Since (Year)",
                                  controller: connectCounselor,
                                  keyboardType: TextInputType.number,
                                  maxlength: 4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText:
                                      "With which temple your counselor is connected to?",
                                  controller: templeCounselor,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Obx(() {
                                if (stateControllerPermanent.isLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  );
                                } else {
                                  return buildDropdown(
                                    'Counselor residing in State',
                                    stateControllerPermanent.stateLists,
                                    //  stateControllerPermanent.selectedItem,
                                    (value) {
                                      setState(() {
                                        selectedState =
                                            value; // Update the state
                                      });
                                      stateControllerPermanent.selectItem(
                                          value); // Call the controller method
                                    },
                                    hintText: 'Select State',
                                  );
                                }
                              }),
                              const SizedBox(
                                height: 15,
                              ),
                              Obx(() {
                                if (cityControllerPermanent.isLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  );
                                } else {
                                  return buildDropdown(
                                    'Counselor residing in City',
                                    cityControllerPermanent.cityLists,
                                    // cityControllerPermanent.selectedItem,
                                    (value) {
                                      setState(() {
                                        selectedCity =
                                            value; // Update the state
                                      });
                                      cityControllerPermanent.selectItem(
                                          value); // Call the controller method
                                    },
                                    hintText: 'Select City',
                                  );
                                }
                              }),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText:
                                      "Something more about the counselor",
                                  maxline: 5,
                                  controller: SomethingCounselor,
                                ),
                              ),
                            ],
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: CustomButton(
                              text: "CONTINUE",
                              onPressed: () => {
                                    spiritualController.spiritualDetails(
                                        context,
                                        nameCounselor.text.toString().trim(),
                                        connectCounselor.text.toString().trim(),
                                        templeCounselor.text.toString().trim(),
                                        selectedState ?? "",
                                        selectedCity ?? "",
                                        SomethingCounselor.text
                                            .toString()
                                            .trim())
                                    //   Get.toNamed('/family')
                                  },
                              color: AppColors.primaryColor,
                              textStyle: FontConstant.styleRegular(
                                  fontSize: 20, color: AppColors.constColor)),
                        ),
                        GestureDetector(
                          onTap: () => {Get.offAndToNamed('/dashboard')},
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "SKIP",
                              style: FontConstant.styleRegular(
                                  fontSize: 20, color: AppColors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            if (spiritualController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
          ]);
        }));
  }
}
