import 'package:devotee/constants/custom_checkbox.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/date_list.dart';
import 'package:devotee/constants/lists/diet_list.dart';
import 'package:devotee/constants/lists/heights_list.dart';
import 'package:devotee/constants/lists/marital_list.dart';
import 'package:devotee/constants/lists/title_list.dart';
import 'package:devotee/constants/lists/weight_list.dart';
import 'package:devotee/controller/basic_details_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({Key? key}) : super(key: key);

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController initiatedNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final FlowController flowController=Get.put(FlowController());



  final BasicDetailsController _basicDetailController =
      Get.put(BasicDetailsController());
  DietController dietController = Get.put(DietController());
  MaritalController maritalController = Get.put(MaritalController());
  HeightController heightController = Get.put(HeightController());
  WeightController weightController = Get.put(WeightController());

  String? selectedTitle;
  String? selectedMaritalStatus;
  String? selectedHeight;
  String? selectedWeight;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedDiet;

  bool isTitleValidated = false;
  bool isHeightValidated = false;
  bool isWeightValidated = false;
  bool isDayValidated = false;
  bool isMonthValidated = false;
  bool isYearValidated = false;

  bool validateDropDown() {
    if (isDayValidated == true &&
        isTitleValidated == true &&
        isHeightValidated == true &&
        isWeightValidated == true &&
        isMonthValidated == true &&
        isYearValidated == true) {
      return true;
    } else {
      return false;
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.clear();
    surnameController.clear();
    initiatedNameController.clear();
    aboutController.clear();
  }
  
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
  };
  String getSelectedHobbies() {
    return hobbies.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .join(", ");
  }

  //bool ismaritalValidated = false;

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
            "Basic Details",
            style:
                FontConstant.styleSemiBold(fontSize: 18, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/profile1');
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
                    left: screenWidth * 0.35,
                    right: screenWidth * 0.35,
                    child: Image.asset('assets/images/profile.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 150),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "(*) Fields are mandatory",
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child: buildDropdown(
                                      'Title *',
                                      TittleController.TittleList(),
                                      (value) => {
                                        setState(() => selectedTitle = value),
                                        isTitleValidated = true
                                      },
                                      borderColor: isTitleValidated == false &&
                                              selectedTitle == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                      hintText: 'Mr',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: "Name *",
                                      controller: nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText: "Surname *",
                                  controller: surnameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter surname';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText: "Initiated Name (Spiritual Name)",
                                  controller: initiatedNameController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child:  buildDropdown(
                                      'Marital Status',
                                      maritalController.getMaritalList(),
                                      (value) {
                                        setState(() {
                                          selectedMaritalStatus =
                                              value; // Update the state
                                        });
                                        maritalController.selectItem(
                                            value); // Call the controller method
                                      },
                                      hintText: 'Select Marital Status',
                                    )
                                
                                
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: buildDropdown(
                                      'Height*',
                                      heightController.getHeightList(),
                                      (value) => {
                                        setState(() => selectedHeight = value),
                                        isHeightValidated = true
                                      },
                                      borderColor: isHeightValidated == false &&
                                              selectedHeight == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                      hintText: 'Choose',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: buildDropdown(
                                      'Weight*',
                                      weightController.getWeightList(),
                                      (value) => {
                                        setState(() => selectedWeight = value),
                                        isWeightValidated = true
                                      },
                                      borderColor: isWeightValidated == false &&
                                              selectedWeight == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                      hintText: '50 Kg',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          _buildDateOfBirthFields(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              "Hobbies",
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: AppColors.black),
                            ),
                          ),
                          Column(
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
                                          style: FontConstant.styleRegular(
                                              fontSize: 15,
                                              color: AppColors.black),
                                        )
                                      ],
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               buildDropdown(
                                    'Diet',
                                    dietController.getDietList(),
                                    (value) {
                                      setState(() {
                                        selectedDiet =
                                            value; // Update the state
                                      });
                                      dietController.selectItem(
                                          value); // Call the controller method
                                    },
                                    hintText: 'Select Diet',
                                  )
                                
                              ,
                              const SizedBox(height: 15),
                              CustomTextField(
                                labelText: "About",
                                
                                maxline: 8,
                                controller: aboutController,
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: CustomButton(
                              text: 'CONTINUE',
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    validateDropDown()) {
                                  String mon = _basicDetailController
                                      .getMonth(selectedMonth.toString());
                                  _basicDetailController.basicDetails(
                                      context,
                                      selectedTitle ?? "",
                                      nameController.text.toString().trim(),
                                      surnameController.text.toString().trim(),
                                      initiatedNameController.text
                                          .toString()
                                          .trim(),
                                      selectedMaritalStatus ?? "",
                                      selectedHeight ?? "",
                                      selectedWeight ?? "",
                                      "$selectedYear-$mon-$selectedDay",
                                      getSelectedHobbies() ?? "",
                                      selectedDiet ?? "",
                                      aboutController.text.toString().trim(),false);
                                  
                                  //   Get.toNamed('/contact');
                                }
                              },
                              color: AppColors.primaryColor,
                              textStyle: FontConstant.styleRegular(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                       //   const SizedBox(height: 15),
                          // _buildSkipButton()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_basicDetailController.isLoading.value||flowController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget _buildDateOfBirthFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Of Birth*',
          style: FontConstant.styleRegular(fontSize: 16, color: Colors.black),
        ),
        Row(
          children: [
            Expanded(
              child: buildDropdown(
                '',
                DayController.DayList(),
                (value) => {
                  setState(() => selectedDay = value),
                  isDayValidated = true
                },
                borderColor: isDayValidated == false && selectedDay == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                hintText: 'Day',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildDropdown(
                '',
                MonthController.MonthList(),
                (value) => {
                  setState(() => selectedMonth = value),
                  isMonthValidated = true
                },
                borderColor: isMonthValidated == false && selectedMonth == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                hintText: 'Month',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildDropdown(
                '',
                YearController.yearList(),
                (value) => {
                  setState(() => selectedYear = value),
                  isYearValidated = true
                },
                borderColor: isYearValidated == false && selectedYear == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                hintText: 'Year',
              ),
            ),
          ],
        ),
      ],
    );
  }
}


// Widget _buildSkipButton() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 5.0),
//     child: CustomButton(
//       text: 'Skip',
//       onPressed: () {
//         Get.offAndToNamed('/dashboard');
//       },
//       color: Colors.transparent,
//       textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
//     ),
//   );
// }
