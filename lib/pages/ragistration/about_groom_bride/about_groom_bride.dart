import 'package:devotee/controller/about_groombride_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_checkbox.dart';
import 'package:devotee/constants/font_constant.dart';

class AboutGroomBride extends StatefulWidget {
  const AboutGroomBride({super.key});

  @override
  State<AboutGroomBride> createState() => _AboutGroomBrideState();
}

class _AboutGroomBrideState extends State<AboutGroomBride> {
  final AboutGroomBrideController aboutGroomBrideController =
      Get.put(AboutGroomBrideController());
  final FlowController flowController = Get.put(FlowController());
  // Define state variables for checkboxes
  Map<String, bool> characteristics = {
    "Independent": false,
    "Affectionate": false,
    "Curious": false,
    "Submissive": false,
    "Extrovert": false,
    "Supportive": false,
    "Calm": false,
    "Friendly": false,
    "Imaginative": false,
    "Cheerful": false,
    "Brilliant": false,
    "Optimistic": false,
  };

  Map<String, bool> hobbies = {
    "Art / Handicraft": false,
    "Yoga": false,
    "Cooking": false,
    "Dancing": false,
    "Gardening / Landscaping": false,
    "Painting": false,
    "Gym": false,
    "Travelling": false,
    "Serving Animals": false,
    "Politics": false,
    "Writing": false,
    "Spending Time With Nature": false,
    "Reading Newspaper": false,
    "Chanting of Holy Names": false,
    "Hearing Krishna Katha": false,
    "Reading Spiritual Books": false,
    "Having Darshan of the Supreme Lord": false,
    "Playing Instruments": false,
    "Holy Dham Visiting": false,
    "Attending and listening to Kirtan": false,
    "Vaishnava Sewa": false,
  };

  // Generate string from selected checkboxes
  String getSelectedCharacteristics() {
    return characteristics.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .join(", ");
  }

  String getSelectedHobbies() {
    return hobbies.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .join(", ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Partner's Desired Qualities",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/packageInfo');
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
                        top: 35, bottom: 100, left: 22, right: 22),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/groombride.png",
                            height: 122,
                            width: 114,
                          ),
                        ),
                        Container(
                          height: 250,
                          child: ScrollbarTheme(
                            data: ScrollbarThemeData(
                                thumbColor: MaterialStateProperty.all(AppColors
                                    .primaryColor), // Change thumb color here
                                trackColor: MaterialStateProperty.all(AppColors
                                    .primaryLight), // Change track color here
                                trackBorderColor: MaterialStateProperty.all(
                                    AppColors.primaryLight),
                                radius: Radius.circular(
                                    10) // Change track border color here
                                ),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              trackVisibility: true,
                              interactive: true,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: characteristics.keys
                                      .take(characteristics.length)
                                      .map((key) => Row(
                                            children: [
                                              CustomCheckbox(
                                                value: characteristics[key]!,
                                                onChanged: (value) {
                                                  setState(() {
                                                    characteristics[key] =
                                                        value;
                                                  });
                                                },
                                              ),
                                              Text(
                                                key,
                                                style:
                                                    FontConstant.styleRegular(
                                                        fontSize: 15,
                                                        color: AppColors.black),
                                              )
                                            ],
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 12, top: 20, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hobbies or Likings",
                            style: FontConstant.styleMedium(
                                fontSize: 18, color: AppColors.primaryColor),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 250,
                          child: ScrollbarTheme(
                            data: ScrollbarThemeData(
                                thumbColor: MaterialStateProperty.all(AppColors
                                    .primaryColor), // Change thumb color here
                                trackColor: MaterialStateProperty.all(AppColors
                                    .primaryLight), // Change track color here
                                trackBorderColor: MaterialStateProperty.all(
                                    AppColors.primaryLight),
                                radius: Radius.circular(
                                    10) // Change track border color here
                                ),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              trackVisibility: true,
                              interactive: true,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: hobbies.keys
                                      .take(hobbies.length)
                                      .map((key) => Row(
                                            children: [
                                              CustomCheckbox(
                                                value: hobbies[key]!,
                                                onChanged: (value) {
                                                  setState(() {
                                                    hobbies[key] = value;
                                                  });
                                                },
                                              ),
                                              Text(
                                                key,
                                                style:
                                                    FontConstant.styleRegular(
                                                        fontSize: 15,
                                                        color: AppColors.black),
                                              )
                                            ],
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: CustomButton(
                            text: "CONTINUE",
                            onPressed: () {
                              String selectedCharacteristics =
                                  getSelectedCharacteristics();
                              String selectedHobbies = getSelectedHobbies();
                              aboutGroomBrideController.aboutGroomBride(
                                  context,
                                  selectedCharacteristics,
                                  selectedHobbies,
                                  false);
                              //   Get.toNamed('/horoscope');
                              print(
                                  "Selected Characteristics: $selectedCharacteristics");
                              print("Selected Hobbies: $selectedHobbies");
                            },
                            color: AppColors.primaryColor,
                            textStyle: FontConstant.styleRegular(
                                fontSize: 20, color: AppColors.constColor),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            // Get.offAndToNamed('/partner')
                            flowController.Flow(context, 12)
                          },
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
            if (aboutGroomBrideController.isLoading.value ||
                flowController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
