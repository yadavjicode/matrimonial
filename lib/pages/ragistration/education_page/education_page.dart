import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/highest_qualification_list.dart';
import 'package:devotee/constants/lists/professional_qualification.dart';
import 'package:devotee/controller/education_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';

class EducationDetails extends StatefulWidget {
  const EducationDetails({super.key});

  @override
  State<EducationDetails> createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  String? selectedHighestQualifaction;
  String? selectedProfessionalQualifaction;
  bool isHighestQualifaction = false;
  final EducationDetailsController _educationController =
      Get.put(EducationDetailsController());
  final FlowController flowController = Get.put(FlowController());
  final TextEditingController describeController = TextEditingController();
  bool show=false;

  @override
  Widget build(BuildContext context) {
    HighestQualController highestQualController =
        Get.put(HighestQualController());
    ProfessionQualController professionQualController =
        Get.put(ProfessionQualController());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Education Qualification",
            style: FontConstant.styleMedium(fontSize: 19, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/location');
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
                    top: 25,
                    left: screenWidth * 0.35,
                    right: screenWidth * 0.35,
                    child: Image.asset('assets/images/educationicon.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.2,
                      left: 22,
                      right: 22,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Obx(() {
                          if (highestQualController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Highest Qualification*',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectedHighestQualifaction = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'Select Highest Qualification',
                            );
                          } else {
                            return buildDropdownWithSearch(
                              // Add 'return' here
                              'Highest Qualification*',
                              highestQualController.getHighestList(),
                              (value) => {
                                setState(
                                    () => selectedHighestQualifaction = value),
                                isHighestQualifaction = true
                              },
                              borderColor:show==true&& selectedHighestQualifaction == null
                                  ? Colors.red
                                  : Colors.black.withOpacity(0.5),
                              errorMessage:
                                  "Please Select Highest Qualification",
                              errorshow:show==true&& selectedHighestQualifaction == null
                                  ? true
                                  : false,
                              selectedItem: selectedHighestQualifaction,
                              hintText: 'Select Highest Qualification',
                            );
                          }
                        }),
                        const SizedBox(height: 15),
                        Obx(() {
                          if (professionQualController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Professional Qualification',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectedProfessionalQualifaction = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'Select Professional Qualification',
                            );
                          } else {
                            return buildDropdownWithSearch(
                                'Professional Qualification',
                                professionQualController
                                    .getProfessionQualList(),
                                // qualificationController.selectedItem.call,
                                (value) => {
                                      setState(() =>
                                          selectedProfessionalQualifaction =
                                              value),
                                    },
                                selectedItem: selectedProfessionalQualifaction,
                                hintText: 'Select Professional Qualification');
                          }
                        }),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: describeController,
                          labelText: "Describe other qualifications (if any)",
                          maxline: 7,
                        ),
                        const SizedBox(height: 30),
                        _buildContinueButton(),
                        const SizedBox(height: 15),
                        _buildSkipButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (_educationController.isLoading.value)
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
          setState(() {
            show=true;
          });
         if (selectedHighestQualifaction != null) {
            _educationController.educationDetails(
                context,
                selectedHighestQualifaction ?? "",
                selectedProfessionalQualifaction ?? "",
                describeController.text.toString().trim(),
                false);

            //    Get.toNamed('/prof');
          }
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
          flowController.Flow(context, 5);
          // Get.offAndToNamed('/prof');
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
