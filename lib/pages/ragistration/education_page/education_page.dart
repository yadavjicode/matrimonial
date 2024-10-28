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
import '../../../controller/edit_profile_controller.dart';
import '../../../controller/skip_controller.dart';

class EducationDetails extends StatefulWidget {
  const EducationDetails({super.key});

  @override
  State<EducationDetails> createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
  String? selectedHighestQualifaction;
  String? selectedProfessionalQualifaction;
  final EducationDetailsController _educationController =
      Get.put(EducationDetailsController());
  final FlowController flowController = Get.put(FlowController());
  final TextEditingController describeController = TextEditingController();
  final SkipController skipController = Get.put(SkipController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final HighestQualController highestQualController =
      Get.put(HighestQualController());
  final ProfessionQualController professionQualController =
      Get.put(ProfessionQualController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((_) {
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/location');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            educationContent(),
            if (_educationController.isLoading.value ||
                _editProfileController.isLoading.value ||
                flowController.isLoading.value ||
                skipController.isLoading.value)
              const Center(
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
          _educationController.educationDetails(
              context,
              selectedHighestQualifaction ?? "",
              selectedProfessionalQualifaction ?? "",
              describeController.text.toString().trim(),
              false);

          //    Get.toNamed('/prof');
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
        text: 'SKIP',
        onPressed: () {
          // flowController.Flow(context, 5);
          // Get.offAndToNamed('/prof');
          skipController.skip(context, "step_5", 5);
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
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
                const SizedBox(height: 30),
                _buildContinueButton(),
                const SizedBox(height: 10),
                _buildSkipButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
