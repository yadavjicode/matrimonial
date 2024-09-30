import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/custom_checkbox.dart';
import 'package:devotee/controller/devotion_details_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';

class DevotionDetails extends StatefulWidget {
  const DevotionDetails({super.key});

  @override
  State<DevotionDetails> createState() => _DevotionDetailsState();
}

class _DevotionDetailsState extends State<DevotionDetails> {
  final TextEditingController nameTemple = TextEditingController();
  final TextEditingController cityTemple = TextEditingController();
  final TextEditingController somethingAbout = TextEditingController();
  final TextEditingController whichSampraya= TextEditingController();
  final FlowController flowController = Get.put(FlowController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final DevotionalDetailsController devotionalController =
      Get.put(DevotionalDetailsController());
  int? selectedValue = -1;
  int? iskon_type;

  List<String> activities = [
    'Chanting',
    'Hearing',
    'Temple Visiting',
    'Reading',
    'Kirtan',
    'Pilgrimage Visiting',
  ];

  String getiskon() {
    if (iskon_type == 1) {
      return "Already Connected with ISKCON";
    } else if (iskon_type == 2) {
      return "Only a Basic idea about ISKCON";
    } else if (iskon_type == 3) {
      return "No idea about ISKCON";
    }
    return "";
  }

  List<String> iskonOptions = [
    'Already Connected with ISKCON',
    'Only a Basic idea about ISKCON',
    'No idea about ISKCON'
  ];

  Map<String, bool> hobbies = {
    "Chanting of Holy Names": false,
    "Hearing Krishna Katha": false,
    "Reading Spiritual Books": false,
    "Having Darshan of the Supreme Lord": false,
    "Playing Instruments": false,
    "Holy Dham Visiting": false,
    "Attending and Listening to Kirtan": false,
    "Vaishnava Seva": false
  };
  String getSelectedHobbies() {
    return hobbies.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .join(", ");
  }

  String? selectedIskonOption;
  bool showTempleFields = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Devotional Details",
            style: FontConstant.styleMedium(fontSize: 19, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/prof');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
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
                  Positioned(
                    top: 20,
                    left: screenWidth * 0.32,
                    right: screenWidth * 0.32,
                    child: Image.asset('assets/images/hands.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.2,
                        left: 22,
                        right: 22,
                        bottom: 100),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          CustomTextField(
                            controller: somethingAbout,
                            labelText: "Something about your Devotional life *",
                            maxline: 5,
                            hintText:
                                "Enter Something about your Devotional life",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Something about your Devotional life';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile<int>(
                                contentPadding: EdgeInsets.zero,
                                title:
                                    const Text('Already Connected with ISKCON'),
                                activeColor: AppColors.primaryColor,
                                value: 1,
                                groupValue: iskon_type,
                                onChanged: (int? value) {
                                  setState(
                                    () {
                                      iskon_type = value;
                                    },
                                  );
                                },
                              ),
                              RadioListTile<int>(
                                contentPadding: EdgeInsets.zero,
                                title: const Text(
                                    'Only a Basic idea about ISKCON'),
                                activeColor: AppColors.primaryColor,
                                value: 2,
                                groupValue: iskon_type,
                                onChanged: (int? value) {
                                  setState(() {
                                    iskon_type = value;
                                  });
                                },
                              ),
                              RadioListTile<int>(
                                contentPadding: EdgeInsets.zero,
                                title: const Text('No idea about ISKCON'),
                                activeColor: AppColors.primaryColor,
                                value: 3,
                                groupValue: iskon_type,
                                onChanged: (int? value) {
                                  setState(() {
                                    iskon_type = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              CustomTextField(
                                labelText:
                                    "With which temple you are connected to?",
                                controller: nameTemple,
                                hintText: "Name of the Temple",
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: cityTemple,
                                hintText: "City of the Temple",
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: whichSampraya,
                                labelText: "Which Sampradaya you belong to?",
                                //   controller: nameTemple,
                                hintText:
                                    "Enter Which Sampradaya you belong to",
                              ),
                              const SizedBox(height: 1),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              "Devotional Hobbies",
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: AppColors.black),
                            ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    style: FontConstant
                                                        .styleRegular(
                                                            fontSize: 15,
                                                            color: AppColors
                                                                .black),
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
                          const SizedBox(height: 20),
                          _buildContinueButton(),
                          const SizedBox(height: 15),
                          _buildSkipButton(),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (devotionalController.isLoading.value ||
                flowController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CustomButton(
        text: 'CONTINUE',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            devotionalController.devotionalDetails(
                context,
                somethingAbout.text.toString().trim(),
                getiskon(),
                nameTemple.text.toString().trim(),
                cityTemple.text,
                whichSampraya.text..toString().trim(),
                getSelectedHobbies(),
                false);
          }

          //  Get.toNamed('/spiritual');
        },
        color: AppColors.primaryColor,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CustomButton(
        text: 'Skip',
        onPressed: () {
          // Get.offAndToNamed('/spiritual');
          flowController.Flow(context, 7);
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
