import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/permanent_type.dart';
import 'package:devotee/constants/lists/relation_list.dart';
import 'package:devotee/constants/lists/residence_type_list.dart';
import 'package:devotee/constants/profile_constant.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:devotee/controller/location_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/CustomTextFeild.dart';
import '/constants/button_constant.dart';
import '/constants/color_constant.dart';
import '/constants/font_constant.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final LocationDetailsController _locationDetailsController =
      Get.put(LocationDetailsController());
  CountryController countryController = Get.put(CountryController());
  StateControllerTemporary stateControllerTemporary =
      Get.put(StateControllerTemporary());
  StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  CityControllerTemporary cityControllerTemporary =
      Get.put(CityControllerTemporary());
  CityControllerPermanent cityControllerPermanent =
      Get.put(CityControllerPermanent());
  ResidenceTypeController residenceTypeController =
      Get.put(ResidenceTypeController());
  PermanentTypeController permanentHouseTypeController =
      Get.put(PermanentTypeController());
  RelationController relationController = Get.put(RelationController());
  String? selectedCountry;
  String? selectedPermanentState;
  String? SelectedTemporaryState;
  String? SelectedPermanentCity;
  String? selectedTemporaryCity;
  String? selectedResidence;
  String? selectedPermanentHouse;
  String? selectedRefeARelation;
  String? selectedRefeBRelation;
  final TextEditingController permanentPinCode = TextEditingController();
  final TextEditingController TemporaryPinCode = TextEditingController();
  final TextEditingController refeAName = TextEditingController();
  final TextEditingController refeAEmail = TextEditingController();
  final TextEditingController refeAPhoneno = TextEditingController();
  final TextEditingController refeBName = TextEditingController();
  final TextEditingController refeBEmail = TextEditingController();
  final TextEditingController refeBPhoneno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ResidenceTypeController residenceTypeController =
        Get.put(ResidenceTypeController());
    return Scaffold(
        backgroundColor: AppColors.primaryLight,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Location details",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/contact');
            },
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 22, right: 22, bottom: 100, top: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/location.png",
                            height: 92,
                            width: 92,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                         buildDropdownWithSearch(
                              'Nationality',
                              countryController.getCountryList(),
                              (value) {
                                setState(() {
                                  selectedCountry = value; // Update the state
                                });
                                countryController.selectItem(
                                    value); // Call the controller method
                              },
                              hintText: 'Select Nationality',
                            )
                          ,
                        
                        const SizedBox(
                          height: 15,
                        ),
                        buildDropdown(
                          'Residence Type',
                          residenceTypeController.getResidenceList(),
                          (value) {
                            setState(() {
                              selectedResidence = value; // Update the state
                            });
                            residenceTypeController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'Select Residence Type',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildDropdown(
                          'Permanent House Type',
                          permanentHouseTypeController.getPermanentList(),
                          (value) {
                            setState(() {
                              selectedPermanentHouse =
                                  value; // Update the state
                            });
                            permanentHouseTypeController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'Select Permanent House Type',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Permanent Address Location',
                          style: FontConstant.styleMedium(
                              fontSize: 18, color: AppColors.primaryColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),   
                        Obx(() {
                          if (stateControllerPermanent.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'State',
                              stateControllerPermanent.stateLists,
                              //  stateControllerPermanent.selectedItem,
                              (value) {
                                setState(() {
                                  selectedPermanentState =
                                      value; // Update the state
                                });
                                stateControllerPermanent.selectItem(
                                    value); // Call the controller method
                              },
                              hintText: 'Select State',
                            );
                          }
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          if (cityControllerPermanent.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'City',
                              cityControllerPermanent.cityLists,
                              // cityControllerPermanent.selectedItem,
                              (value) {
                                setState(() {
                                  SelectedPermanentCity =
                                      value; // Update the state
                                });
                                cityControllerPermanent.selectItem(
                                    value); // Call the controller method
                              },
                              hintText: 'Select City',
                            );
                          }
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: permanentPinCode,
                          labelText: 'Pin Code',
                          maxlength: 6,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Temporary Address Location',
                          style: FontConstant.styleMedium(
                              fontSize: 18, color: AppColors.primaryColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          if (stateControllerTemporary.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'State',
                              stateControllerTemporary.stateLists,
                              // stateControllerTemporary.selectedItem,
                              (value) {
                                setState(() {
                                  SelectedTemporaryState =
                                      value; // Update the state
                                });
                                stateControllerTemporary.selectItem(
                                    value); // Call the controller method
                              },
                              hintText: 'Select State',
                            );
                          }
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          if (cityControllerTemporary.isLoading.value) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'City',
                              cityControllerTemporary.cityLists,
                              //  cityControllerTemporary.selectedItem,
                              (value) {
                                setState(() {
                                  selectedTemporaryCity =
                                      value; // Update the state
                                });
                                cityControllerTemporary.selectItem(
                                    value); // Call the controller method
                              },
                              hintText: 'Select City',
                            );
                          }
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: TemporaryPinCode,
                          labelText: 'Pin Code',
                          maxlength: 6,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Reference 1',
                          style: FontConstant.styleMedium(
                              fontSize: 18, color: AppColors.primaryColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildDropdown(
                          'Relation',
                          relationController.getRelationList(),
                          // residenceTypeController.selectItem,
                          (value) {
                            setState(() {
                              selectedRefeARelation = value; // Update the state
                            });
                            relationController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'Select Relation',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: refeAName,
                          labelText: 'Name',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: refeAEmail,
                          labelText: 'Email',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: refeAPhoneno,
                          labelText: 'Mobile',
                          keyboardType: TextInputType.phone,
                          maxlength: 10,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Reference 2',
                          style: FontConstant.styleMedium(
                              fontSize: 18, color: AppColors.primaryColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: const BoxDecoration(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildDropdown(
                          'Relation',
                          relationController.getRelationList(),
                          // residenceTypeController.selectItem,
                          (value) {
                            setState(() {
                              selectedRefeBRelation = value; // Update the state
                            });
                            relationController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'Select Relation',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: refeBName,
                          labelText: 'Name',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: refeBEmail,
                          labelText: 'Email',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          maxline: 1,
                          controller: refeBPhoneno,
                          labelText: 'Mobile',
                          keyboardType: TextInputType.phone,
                          maxlength: 10,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          text: 'CONTINUE',
                          onPressed: () {
                            _locationDetailsController.locationDetails(
                                context,
                                selectedCountry ?? "",
                                selectedResidence ?? "",
                                selectedPermanentHouse ?? "",
                                selectedPermanentState ?? "",
                                SelectedPermanentCity ?? "",
                                permanentPinCode.text.toString().trim(),
                                SelectedTemporaryState ?? "",
                                selectedTemporaryCity ?? "",
                                TemporaryPinCode.text.toString().trim(),
                                selectedRefeARelation ?? "",
                                refeAName.text.toLowerCase().trim(),
                                refeAEmail.text.toString().trim(),
                                refeAPhoneno.text.toString().trim(),
                                selectedRefeBRelation ?? "",
                                refeBName.text.toString().trim(),
                                refeBEmail.text.toString().trim(),
                                refeBPhoneno.text.toString().trim());
                            //  Get.toNamed('/education');
                            print(
                                "${selectedCountry ?? ""}$selectedPermanentHouse");
                          },
                          color: AppColors.primaryColor,
                          textStyle: FontConstant.styleRegular(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            if (_locationDetailsController.isLoading.value)
              Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
  }
}
