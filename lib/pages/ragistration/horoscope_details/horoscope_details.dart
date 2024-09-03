import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/controller/HoroscopeDetailsController.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoroscopeDetails extends StatefulWidget {
  const HoroscopeDetails({super.key});

  @override
  State<HoroscopeDetails> createState() => _HoroscopeDetailsState();
}

class _HoroscopeDetailsState extends State<HoroscopeDetails> {
 final StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());

 final HoroscopeDetailsController horoscopeDetailsController =
      Get.put(HoroscopeDetailsController());

  TextEditingController time = TextEditingController();

  String? selectedState;
  String? selectedCity;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final String formattedTime = picked.format(context);
      setState(() {
        time.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryLight,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Horoscope Details",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/family');
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
                    padding:
                        const EdgeInsets.only(top: 35, left: 22, right: 22),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/horoscope.png",
                              height: 117,
                              width: 109,
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Time Of Birth",
                            style: FontConstant.styleRegular(
                                fontSize: 16, color: AppColors.black),
                          ),
                        ),
                        CustomTextField(
                          suffixIcon: Icon(
                            Icons.av_timer,
                            color: AppColors.black,
                          ),
                          controller: time,
                          hintText: "Select Time",
                          onTap: () => _selectTime(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Obx(() {
                            if (stateController.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            } else {
                              return buildDropdownWithSearch(
                                'State of Birth',
                                stateController.getStateList(),
                                (value) {
                                  setState(() {
                                    selectedState = value; // Update the state
                                  });
                                  stateController.selectItem(
                                      value); // Call the controller method
                                },
                                hintText: 'Select State',
                              );
                            }
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Obx(() {
                            if (cityController.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            } else {
                              return buildDropdownWithSearch(
                                'City of Birth',
                                cityController.cityLists,
                                (value) {
                                  setState(() {
                                    selectedCity = value; // Update the state
                                  });
                                  cityController.selectItem(
                                      value); // Call the controller method
                                },
                                hintText: 'Select City',
                              );
                            }
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: CustomButton(
                              text: "CONTINUE",
                              onPressed: () => {
                                    horoscopeDetailsController.horoscopeDetails(
                                        context,
                                        time.text.toString().trim(),
                                        selectedState ?? "",
                                        selectedCity ?? "")
                                    //    Get.toNamed('/profile')
                                  },
                              color: AppColors.primaryColor,
                              textStyle: FontConstant.styleRegular(
                                  fontSize: 20, color: AppColors.constColor)),
                        ),
                        GestureDetector(
                          onTap: () => {Get.offAndToNamed('/profile')},
                          child: Container(
                            margin: EdgeInsets.only(bottom: 25, top: 10),
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
            if (horoscopeDetailsController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
