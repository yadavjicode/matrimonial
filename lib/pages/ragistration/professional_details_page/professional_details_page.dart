import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/empolyment_list.dart';
import 'package:devotee/constants/lists/income_list.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/title_profession_list.dart';
import 'package:devotee/controller/professional_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessionalDetailsPage extends StatefulWidget {
  const ProfessionalDetailsPage({super.key});

  @override
  State<ProfessionalDetailsPage> createState() =>
      _ProfessionalDetailsPageState();
}

class _ProfessionalDetailsPageState extends State<ProfessionalDetailsPage> {
  TextEditingController pincodeController = TextEditingController();
  ProfessionController professionController = Get.put(ProfessionController());
  IncomeController incomeController = Get.put(IncomeController());
  EmpolymentController employmentController = Get.put(EmpolymentController());
  ProfessionalDetailsController professionalDeatilsController =
      Get.put(ProfessionalDetailsController());
  // StateControllerPermanent stateControllerPermanent =
  //     Get.put(StateControllerPermanent());
  // CityControllerPermanent cityControllerPermanent =
  //     Get.put(CityControllerPermanent());

  final StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());

  String? selectedProfession;
  String? selectedAnnualSalary;
  String? selectedEmpolyment;
  String? selectedState;
  String? selectedCity;

  int? selectedRadioValue; // Add this line

  String working() {
    if (selectedRadioValue == 1) {
      return "Yes";
    } else if(selectedRadioValue==2)
    {
      return "No";
    }else{
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract data

    return Scaffold(
        backgroundColor: AppColors.primaryLight,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Professional Details",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/education');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            Stack(children: [
              Container(
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/images/background.png")),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, top: 35, bottom: 100),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Image.asset("assets/images/occupation.png"),
                      ),
                      buildDropdownWithSearch(
                        'Title of the Profession',
                        professionController.getProfessionList(),
                        (value) {
                          setState(() {
                            selectedProfession = value; // Update the state
                          });
                          professionController
                              .selectItem(value); // Call the controller method
                        },
                        hintText: 'Select Profession',
                        selectedItem: selectedProfession
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Working anywhere? *",
                            style: FontConstant.styleRegular(
                                fontSize: 16, color: AppColors.black),
                          )),
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: 1,
                            groupValue: selectedRadioValue,
                            onChanged: (value) => {
                              setState(() {
                                selectedRadioValue = value!;
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
                            groupValue: selectedRadioValue,
                            onChanged: (value) => {
                              setState(() {
                                selectedRadioValue = value!;
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
                      if (selectedRadioValue== 1)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: buildDropdownWithSearch(
                                "Empolyment",
                                employmentController.getEmpolymentList(),
                                //  cityControllerTemporary.selectedItem,
                                (value) {
                                  setState(() {
                                    selectedEmpolyment =
                                        value; // Update the state
                                  });
                                  employmentController.selectItem(
                                      value); // Call the controller method
                                },
                                hintText: 'Select Empolyment',
                              ),
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
                                    'Working State',
                                   stateController.getStateList(),
                                    //  stateControllerPermanent.selectedItem,
                                    (value) {
                                      setState(() {
                                        selectedState =
                                            value; // Update the state
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
                                    'Working City',
                                       cityController.cityLists,
                                    // cityControllerPermanent.selectedItem,
                                    (value) {
                                      setState(() {
                                        selectedCity =
                                            value; // Update the state
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
                              padding: const EdgeInsets.only(top: 15),
                              child: CustomTextField(
                                controller: pincodeController,
                                labelText: "Pin Code",
                                keyboardType: TextInputType.number,
                                maxlength: 6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: buildDropdownWithSearch('Annual Income Range',
                                  incomeController.getIncomeList(), (value) {
                                setState(() {
                                  selectedAnnualSalary =
                                      value; // Update the state
                                });

                                incomeController.selectItem(
                                    value); // Call the controller method
                              }, hintText: 'Select Annual Income Range'),
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 15),
                        child: CustomButton(
                            text: "CONTINUE",
                            onPressed: () => {
                                  professionalDeatilsController
                                      .professionalDetails(
                                          context,
                                          selectedProfession ?? "",
                                          working(),
                                          selectedEmpolyment ?? "",
                                          selectedState ?? "",
                                          selectedCity ?? "",
                                          pincodeController.text
                                              .toString()
                                              .trim(),
                                          selectedAnnualSalary ?? ""),

                                  //   Get.toNamed('/devotion')
                                },
                            color: AppColors.primaryColor,
                            textStyle: FontConstant.styleRegular(
                                fontSize: 20, color: AppColors.constColor)),
                      ),
                      GestureDetector(
                        onTap: () => {Get.offAndToNamed('/devotion')},
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
              ),
            ]),
            if (professionalDeatilsController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
