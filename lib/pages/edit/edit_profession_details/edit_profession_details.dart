import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/empolyment_list.dart';
import 'package:devotee/constants/lists/income_list.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/title_profession_list.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/professional_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfessionalDetails extends StatefulWidget {
  const EditProfessionalDetails({super.key});

  @override
  State<EditProfessionalDetails> createState() =>
      _EditProfessionalDetailsState();
}

class _EditProfessionalDetailsState extends State<EditProfessionalDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  TextEditingController pincodeController = TextEditingController();
  ProfessionController professionController = Get.put(ProfessionController());
  IncomeController incomeController = Get.put(IncomeController());
  EmpolymentController employmentController = Get.put(EmpolymentController());
  ProfessionalDetailsController professionalDeatilsController =
      Get.put(ProfessionalDetailsController());
  final StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());

  String? selectedProfession;
  String? selectedAnnualSalary;
  String? selectedEmpolyment;
  String? selectedState;
  String? selectedCity;

  int? selectedRadioValue; // Add this line
  bool show = false;

  String? working() {
    if (selectedRadioValue == 1) {
      return "Yes";
    } else if (selectedRadioValue == 2) {
      return "No";
    } else {
      return null;
    }
  }

  bool validation() {
    if (working() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((value) {
        setState(() {
          selectedProfession =
              _editProfileController.member?.member?.occupation;
          selectedEmpolyment =
              _editProfileController.member?.member?.employedin;
          selectedState = _editProfileController.member?.member?.workState;
          selectedCity = _editProfileController.member?.member?.workCity;
          selectedAnnualSalary =
              _editProfileController.member?.member?.annualincome;
          pincodeController.text =
              _editProfileController.member?.member?.workPincode ?? "";
          stateController
              .selectItem(_editProfileController.member?.member?.workState);
          if (_editProfileController.member?.member?.workingAnywhere == "Yes") {
            selectedRadioValue = 1;
          } else if (_editProfileController.member?.member?.workingAnywhere ==
              "No") {
            selectedRadioValue = 2;
          }
        });
      });
    });
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
        ),
        body: Obx(() {
          return Stack(children: [
            Stack(children: [
              Container(
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/images/background.png")),
              professionalContent()
            ]),
            if (professionalDeatilsController.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget professionalContent() {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 22, right: 22, top: 35, bottom: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset("assets/images/occupation.png"),
              ),
              Obx(() {
                if (professionController.isLoading.value) {
                  return buildDropdownWithSearch(
                    'Title of the Profession *',
                    ['Loading...'],
                    (value) {
                      setState(() {
                        selectedProfession = null;
                      });
                    },
                    selectedItem: 'Loading...',
                    hintText: 'Select Profession',
                  );
                } else {
                  return buildDropdownWithSearch(
                    'Title of the Profession *',
                    professionController.getProfessionList(),
                    (value) {
                      setState(() {
                        selectedProfession = value; // Update the state
                      });
                      professionController
                          .selectItem(value); // Call the controller method
                    },
                    selectedItem: selectedProfession,
                    hintText: 'Select Profession',
                  );
                }
              }),
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
                  ),
                  Spacer(),
                ],
              ),
              if (show == true && working() == null)
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "are you Working anywhere",
                      style: FontConstant.styleRegular(
                          fontSize: 11, color: AppColors.red),
                    )),
              if (working() == "Yes")
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Obx(() {
                        if (employmentController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Empolyment *',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedEmpolyment = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Empolyment',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            "Empolyment *",
                            employmentController.getEmpolymentList(),
                            //  cityControllerTemporary.selectedItem,
                            (value) {
                              setState(() {
                                selectedEmpolyment = value; // Update the state
                              });
                              employmentController.selectItem(
                                  value); // Call the controller method
                            },

                            selectedItem: selectedEmpolyment,

                            hintText: 'Select Empolyment',
                          );
                        }
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Obx(() {
                        if (stateController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Working State *',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedState = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select State',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Working State *',
                            [
                              'Prefer Not To Say',
                              ...stateController.getStateList()
                            ],
                            //  stateControllerPermanent.selectedItem,
                            (value) {
                              setState(() {
                                selectedState = value;
                                selectedCity = null; // Update the state
                              });
                              stateController.selectItem(
                                  value); // Call the controller method
                            },

                            selectedItem: selectedState,
                            hintText: 'Select State',
                          );
                        }
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Obx(() {
                        if (cityController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Working City *',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedCity = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select City',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Working City *',
                            ['Prefer Not To Say', ...cityController.cityLists],
                            // cityControllerPermanent.selectedItem,
                            (value) {
                              setState(() {
                                selectedCity = value; // Update the state
                              });
                              cityController.selectItem(
                                  value); // Call the controller method
                            },

                            selectedItem: selectedCity,
                            hintText: 'Select City',
                          );
                        }
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        controller: pincodeController,
                        labelText: "Pin Code/ ZIP Code *",
                        keyboardType: TextInputType.number,
                        maxlength: 6,
                        hintText: "Enter Pin Code/ ZIP Code",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Obx(() {
                        if (incomeController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Annual Income Range *',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedAnnualSalary = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Annual Income Range',
                          );
                        } else {
                          return buildDropdownWithSearch(
                              'Annual Income Range *',
                              incomeController.getIncomeList(), (value) {
                            setState(() {
                              selectedAnnualSalary = value; // Update the state
                            });

                            incomeController.selectItem(
                                value); // Call the controller method
                          },
                              selectedItem: selectedAnnualSalary,
                              hintText: 'Select Annual Income Range');
                        }
                      }),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: CustomButton(
                    text: "CONTINUE",
                    onPressed: () {
                      setState(() {
                        show = true;
                      });
                      if (validation()) {
                        professionalDeatilsController.professionalDetails(
                            context,
                            selectedProfession ?? "",
                            working() ?? "",
                            working() == "Yes" ? selectedEmpolyment ?? "" : "",
                            working() == "Yes" ? selectedState ?? "" : "",
                            working() == "Yes" ? selectedCity ?? "" : "",
                            working() == "Yes"
                                ? pincodeController.text.toString().trim()
                                : "",
                            working() == "Yes"
                                ? selectedAnnualSalary ?? ""
                                : "",
                            true);
                      }

                      //   Get.toNamed('/devotion')
                    },
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleRegular(
                        fontSize: 20, color: AppColors.constColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
