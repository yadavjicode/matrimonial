import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/highest_qualification_list.dart';
import 'package:devotee/constants/lists/professional_qualification.dart';
import 'package:devotee/controller/education_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';

class EditEducationdetails extends StatefulWidget {
  const EditEducationdetails({super.key});

  @override
  State<EditEducationdetails> createState() => _EditEducationdetailsState();
}

class _EditEducationdetailsState extends State<EditEducationdetails> {
  String? selectedHighestQualifaction;
  String? selectedProfessionalQualifaction;
  bool isHighestQualifaction = false;
  final EducationDetailsController _educationController =
      Get.put(EducationDetailsController());

  final TextEditingController describeController = TextEditingController();
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
                        buildDropdown(
                            'Highest Qualification*',
                            highestQualController.getHighestList(),
                            //   qualificationController.selectedItem.call,
                            (value) => {
                                  setState(() =>
                                      selectedHighestQualifaction = value),
                                  isHighestQualifaction = true
                                },
                            borderColor: isHighestQualifaction == false &&
                                    selectedHighestQualifaction == null
                                ? Colors.red
                                : Colors.black.withOpacity(0.5),
                            hintText: 'Select Highest Qualification'),
                        const SizedBox(height: 15),
                        buildDropdown(
                            'Professional Qualification',
                            professionQualController.getProfessionQualList(),
                            // qualificationController.selectedItem.call,
                            (value) => {
                                  setState(() =>
                                      selectedProfessionalQualifaction = value),
                                },
                            hintText: 'Select Professional Qualification'),
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
          if (isHighestQualifaction != false &&
              selectedHighestQualifaction != null) {
            _educationController.educationDetails(
                context,
                selectedHighestQualifaction ?? "",
                selectedProfessionalQualifaction ?? "",
                describeController.text.toString().trim());

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
          Get.offAndToNamed('/dashboard');
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
