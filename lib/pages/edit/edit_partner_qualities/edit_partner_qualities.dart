import 'package:devotee/controller/about_groombride_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_checkbox.dart';
import 'package:devotee/constants/font_constant.dart';

class EditPartnerQualites extends StatefulWidget {
  const EditPartnerQualites({super.key});

  @override
  State<EditPartnerQualites> createState() => _EditPartnerQualitesState();
}

class _EditPartnerQualitesState extends State<EditPartnerQualites> {
  final AboutGroomBrideController aboutGroomBrideController =
      Get.put(AboutGroomBrideController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
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

  void selectHobbies(String selectedHobbies) {
    List<String> selectedList = selectedHobbies.split(', ');
    hobbies.forEach((key, value) {
      hobbies[key] = selectedList.contains(key);
    });
  }

  void selectQualities(String selectQualities) {
    List<String> selectedList = selectQualities.split(', ');

    characteristics.forEach((key, value) {
      characteristics[key] = selectedList.contains(key);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((value) {
        setState(() {
          selectHobbies(_editProfileController.member?.member?.GBHobbies ?? "");
          selectQualities(
              _editProfileController.member?.member?.groomBride ?? "");
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            "Partner's Desired Qualities",
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
                    child: Image.asset("assets/images/background.png")),
                partnerQualitiesContent()
              ],
            ),
            if (aboutGroomBrideController.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget partnerQualitiesContent() {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 35, bottom: 30, left: 22, right: 22),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/groombride.png",
                height: 122,
                width: 114,
              ),
            ),
            SizedBox(
              height: 250,
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(
                        AppColors.primaryColor), // Change thumb color here
                    trackColor: MaterialStateProperty.all(
                        AppColors.primaryLight), // Change track color here
                    trackBorderColor:
                        MaterialStateProperty.all(AppColors.primaryLight),
                    radius:
                        Radius.circular(10) // Change track border color here
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
                                        characteristics[key] = value;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      key,
                                      style: FontConstant.styleRegular(
                                          fontSize: 15, color: AppColors.black),
                                    ),
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
              margin: EdgeInsets.only(left: 12, top: 20, bottom: 10),
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 250,
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(
                        AppColors.primaryColor), // Change thumb color here
                    trackColor: MaterialStateProperty.all(
                        AppColors.primaryLight), // Change track color here
                    trackBorderColor:
                        MaterialStateProperty.all(AppColors.primaryLight),
                    radius:
                        Radius.circular(10) // Change track border color here
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
                                  Expanded(
                                    child: Text(
                                      key,
                                      style: FontConstant.styleRegular(
                                          fontSize: 15, color: AppColors.black),
                                    ),
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
              padding: const EdgeInsets.only(top: 25),
              child: CustomButton(
                text: "CONTINUE",
                onPressed: () {
                  String selectedCharacteristics = getSelectedCharacteristics();
                  String selectedHobbies = getSelectedHobbies();
                  aboutGroomBrideController.aboutGroomBride(
                      context, selectedCharacteristics, selectedHobbies, true);
                  //   Get.toNamed('/horoscope');
                  print("Selected Characteristics: $selectedCharacteristics");
                  print("Selected Hobbies: $selectedHobbies");
                },
                color: AppColors.primaryColor,
                textStyle: FontConstant.styleRegular(
                    fontSize: 20, color: AppColors.constColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
