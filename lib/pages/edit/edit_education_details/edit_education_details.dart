import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/highest_qualification_list.dart';
import 'package:devotee/constants/lists/professional_qualification.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
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
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final HighestQualController highestQualController =
      Get.put(HighestQualController());
  final ProfessionQualController professionQualController =
      Get.put(ProfessionQualController());
  bool show = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((value) {
        setState(() {
          selectedHighestQualifaction =
              _editProfileController.member?.member?.education;
          selectedProfessionalQualifaction =
              _editProfileController.member?.member?.professionalQualification;
          describeController.text =
              _editProfileController.member?.member?.otherQualification ?? "";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        body: Obx(() {
          return Stack(children: [
            educationContent(),
            if (_editProfileController.isLoading.value ||
                _educationController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget educationContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
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
                        setState(() => selectedHighestQualifaction = value),
                        isHighestQualifaction = true
                      },

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
                        professionQualController.getProfessionQualList(),
                        // qualificationController.selectedItem.call,
                        (value) => {
                              setState(() =>
                                  selectedProfessionalQualifaction = value),
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
                  hintText: "Enter Other Qualifications",
                ),
                const SizedBox(height: 25),
                _buildContinueButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CustomButton(
        text: 'CONTINUE',
        onPressed: () {
          _educationController.educationDetails(
              context,
              selectedHighestQualifaction ?? "",
              selectedProfessionalQualifaction ?? "",
              describeController.text.toString().trim(),
              true);

          //    Get.toNamed('/prof');
        },
        color: AppColors.primaryColor,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
