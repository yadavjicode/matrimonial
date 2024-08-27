import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/controller/collaborate_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:devotee/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollaborateWithUs extends StatefulWidget {
  const CollaborateWithUs({super.key});

  @override
  State<CollaborateWithUs> createState() => _CollaborateWithUsState();
}

class _CollaborateWithUsState extends State<CollaborateWithUs> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
 // StateController countryController = Get.put(StateController());
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final  StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());
  final CollaborateController collaborateController =
      Get.put(CollaborateController());

  
  String? selectedState;
  String? selectedCity;
  bool isState = false;
  bool isCity = false;

  bool validateDropDown() {
    if (isState == true && isCity == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    // stateController
    //     .fetchStateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Collaborate With Us",
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
                    child: Image.asset("assets/images/bg3.png")),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Image.asset("assets/images/Collaborate.png",
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              DrawerCommanCode()
                                  .buildTextBold("Hare Krishna!\n"),
                              DrawerCommanCode().buildText(
                                  "If you liked our work and you also want to become a part of this glorious seva then you can give us your details, our team will contact you.\n"),
                              CustomTextField(
                                controller: name,
                                labelText: "Your Name",
                                borderRadius: 5,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      controller: phone,
                                      labelText: "Phone No.",
                                      borderRadius: 5,
                                      validator: (value) {
                                        return Validation.validatePhoneno(
                                            value);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      controller: email,
                                      labelText: "Email ID",
                                      borderRadius: 5,
                                      validator: (value) {
                                        return Validation.validateEmail(value);
                                      },
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                           
                              Row(
                                children: [
                                  Expanded(
                                    child: Obx(() {
                                      if (stateController.isLoading.value) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return buildDropdownWithSearch(
                                          'State',
                                          stateController.getStateList(),
                                          radiusdrop: 6,
                                      //    stateController.selectedItem,
                                          (value) {
                                            setState(() {
                                              selectedState = value;
                                              // Update the state
                                              isState = true;
                                              isCity =
                                                  false; // Reset city when state changes
                                              selectedCity = null;
                                            });
                                            stateController.selectItem(
                                                value); // Call the controller method
                                          },
                                          borderColor: isState == false &&
                                                  selectedState == null
                                              ? Colors.red
                                              : Colors.black.withOpacity(0.5),
                                          hintText: 'Select State',
                                        );
                                      }
                                    }),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Obx(() {
                                      if (cityController.isLoading.value) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return buildDropdownWithSearch(
                                          'City',
                                          cityController.cityLists,
                                           radiusdrop: 6,
                                          // cityControllerPermanent.selectedItem,
                                          (value) {
                                            setState(() {
                                              selectedCity =
                                                  value; // Update the state
                                              isCity = true;
                                            });
                                            cityController.selectItem(
                                                value); // Call the controller method
                                          },
                                          borderColor: isCity == false &&
                                                  selectedCity == null
                                              ? Colors.red
                                              : Colors.black.withOpacity(0.5),
                                          hintText: 'Select City',
                                        );
                                      }
                                    }),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  alignment: Alignment.centerRight,
                                  child: CustomDrawerButton(
                                    color: AppColors.primaryColor,
                                    text: "SUBMIT",
                                    onPressed: () => {
                                      if (_formKey.currentState!.validate() &&
                                          validateDropDown())
                                        {
                                          collaborateController.collaborate(
                                              context,
                                              name.text.toString().trim(),
                                              phone.text.toString().trim(),
                                              email.text.toString().trim(),
                                              selectedCity.toString(),
                                              selectedState.toString())
                                        }
                                    },
                                    textStyle: FontConstant.styleRegular(
                                        fontSize: 14,
                                        color: AppColors.constColor),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            if (collaborateController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
    ;
  }
}
