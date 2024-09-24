import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/empolyment_list.dart';
import 'package:devotee/constants/lists/income_list.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/title_profession_list.dart';
import 'package:devotee/controller/flow_controller.dart';
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
  final StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());
  final FlowController flowController = Get.put(FlowController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedProfession;
  String? selectedAnnualSalary;
  String? selectedEmpolyment;
  String? selectedState;
  String? selectedCity;
  bool show = false;

  int? selectedRadioValue; // Add this line

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
    if (working() != null && selectedProfession != null) {
      if (working() == "Yes") {
        if (_formKey.currentState!.validate() &&
            selectedAnnualSalary != null &&
            selectedEmpolyment != null &&
            selectedState != null &&
            selectedCity != null) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // stateController.fetchStateList();
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
                                  selectedProfession =
                                      value; // Update the state
                                });
                                professionController.selectItem(
                                    value); // Call the controller method
                              },
                              selectedItem: selectedProfession,
                              hintText: 'Select Profession',
                              errorMessage: "Please Select Profession",
                              errorshow:show==true&&
                                  selectedProfession == null ? true : false,
                              borderColor:show==true&& selectedProfession == null
                                  ? Colors.red
                                  : Colors.black.withOpacity(0.5),
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
                            )
                          ],
                        ),
                        if (show==true&&working() == null)
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
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
                                          selectedEmpolyment =
                                              value; // Update the state
                                        });
                                        employmentController.selectItem(
                                            value); // Call the controller method
                                      },
                                      borderColor:show==true&& selectedEmpolyment == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                     
                                      errorMessage: "Please Select Empolyment",
                                      errorshow:show==true&& selectedEmpolyment == null
                                          ? true
                                          : false,
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
                                      stateController.getStateList(),
                                      //  stateControllerPermanent.selectedItem,
                                      (value) {
                                        setState(() {
                                          selectedState = value;
                                          selectedCity =
                                              null; // Update the state
                                        });
                                        stateController.selectItem(
                                            value); // Call the controller method
                                      },
                                      borderColor:show==true&& selectedState == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                      errorMessage:
                                          "Please Select Working State",
                                      errorshow:show==true&&
                                          selectedState == null ? true : false,
                                
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
                                      borderColor:show==true&& selectedCity == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                      errorMessage:
                                          "Please Select Working City",
                                      errorshow:show==true&&
                                          selectedCity == null ? true : false,
                                     
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
                                  hintText: "Enter Pin Code",
                                  maxlength: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Pin Code';
                                    }
                                    return null;
                                  },
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
                                        incomeController.getIncomeList(),
                                        (value) {
                                      setState(() {
                                        selectedAnnualSalary =
                                            value; // Update the state
                                      });

                                      incomeController.selectItem(
                                          value); // Call the controller method
                                    },
                                        borderColor:show==true&&
                                            selectedAnnualSalary == null
                                                ? Colors.red
                                                : Colors.black.withOpacity(0.5),
                                       
                                        errorMessage: "Please Annual Income",
                                        errorshow:show==true&& selectedAnnualSalary == null
                                            ? true
                                            : false,
                                        hintText: 'Select Annual Income Range');
                                  }
                                }),
                              ),
                            ],
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 15),
                          child: CustomButton(
                              text: "CONTINUE",
                              onPressed: ()  {
                                    setState(() {
                                      show = true;
                                    });
                                    if (validation())
                                      {
                                        professionalDeatilsController
                                            .professionalDetails(
                                                context,
                                                selectedProfession ?? "",
                                                working()!,
                                                working() == "Yes"
                                                    ? selectedEmpolyment ?? ""
                                                    : "",
                                                working() == "Yes"
                                                    ? selectedState ?? ""
                                                    : "",
                                                working() == "Yes"
                                                    ? selectedCity ?? ""
                                                    : "",
                                                working() == "Yes"
                                                    ? pincodeController.text
                                                        .toString()
                                                        .trim()
                                                    : "",
                                                working() == "Yes"
                                                    ? selectedAnnualSalary ?? ""
                                                    : "",
                                                false);
                                      }

                                    //   Get.toNamed('/devotion')
                                  },
                              color: AppColors.primaryColor,
                              textStyle: FontConstant.styleRegular(
                                  fontSize: 20, color: AppColors.constColor)),
                        ),
                        GestureDetector(
                          onTap: () => {
                            // Get.offAndToNamed('/devotion')
                            flowController.Flow(context, 6)
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
                ),
              ),
            ]),
            if (professionalDeatilsController.isLoading.value||flowController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
