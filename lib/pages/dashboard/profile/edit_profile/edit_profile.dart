import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Profile",
          style: FontConstant.styleSemiBold(
            fontSize: 18,
            color: AppColors.constColor,
          ),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            if (_editProfileController.isLoading.value == false)
              _buildProfileContent(),
            if (_editProfileController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildProfileContent() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.topRight,
          child: Image.asset("assets/images/background.png"),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 305,
                width: double.infinity,
                color: AppColors.constColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/noimage.png",
                      width: 179,
                      height: 172,
                    ),
                    Text(
                      "+ Add Image",
                      style: FontConstant.styleRegular(
                        fontSize: 23,
                        color: Color(0xff583689),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/phone.png"),
                          Text(
                            "Edit Mobile No.",
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/message.png"),
                          SizedBox(width: 10),
                          Text(
                            "Edit Email ID",
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text(
                  "Your profile is 40% Complete",
                  style: FontConstant.styleRegular(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.grey.shade100,
                    color: Color(0xff583689),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Make your profile 100% complete by adding below\ndetails and get more responses.",
                  style: FontConstant.styleRegular(
                    fontSize: 13,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                  right: 15,
                  bottom: 40,
                ),
                child: Column(
                  children: [
                    _buildCont(
                      "Basic Details",
                      Column(
                        children: [
                          _buildText("Posted by",
                              _editProfileController.postedby.toString() ?? ""),
                          _buildText("Title",
                              _editProfileController.tittle.toString() ?? ""),
                          _buildText("Name",
                              _editProfileController.name.toString() ?? ""),
                          _buildText("Surname",
                              _editProfileController.surname.toString() ?? ""),
                          _buildText("Date of Birth",
                              _editProfileController.dob.toString() ?? ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Location Details",
                      Column(
                        children: [
                          _buildText(
                              "Nationality",
                              _editProfileController.nationality.toString() ??
                                  ""),
                          _buildText(
                              "Residence Type",
                              _editProfileController.residenceType.toString() ??
                                  ""),
                          _buildText(
                              "Permanent House Type",
                              _editProfileController.permanentHouseType
                                      .toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Educational Details",
                      Column(
                        children: [
                          _buildText(
                              "Highest Qualification",
                              _editProfileController.highestQualification
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Professional Qualification",
                              _editProfileController.professionalQualification
                                      .toString() ??
                                  ""),
                          _buildText("Other Details", ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Profession Details",
                      Column(
                        children: [
                          _buildText(
                              "Profession Tittle",
                              _editProfileController.professionTittle
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Employment",
                              _editProfileController.empolyment.toString() ??
                                  ""),
                          _buildText(
                              "Working State",
                              _editProfileController.workingState.toString() ??
                                  ""),
                          _buildText(
                              "Working City",
                              _editProfileController.workingCity.toString() ??
                                  ""),
                          _buildText(
                              "Pincode",
                              _editProfileController.workingpincode
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Annual Salary Range",
                              _editProfileController.annualSalary.toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Devotional Details",
                      Column(
                        children: [
                          _buildText(
                              "About Devotional Life",
                              _editProfileController.aboutDevotional
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Iskcon Knowledge",
                              _editProfileController.iskonKnow.toString() ??
                                  ""),
                          _buildText(
                              "In Which Temple You Are Connected To",
                              _editProfileController.whichTemple.toString() ??
                                  ""),
                          _buildText(
                              "Devotional Habits",
                              _editProfileController.devotionalHabit
                                      .toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Spiritual Counsellor Details",
                      Column(
                        children: [
                          _buildText(
                              "Connected with Since",
                              _editProfileController.connectedWithSince
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Connected Temple",
                              _editProfileController.connectTemple.toString() ??
                                  ""),
                          _buildText(
                              "Counselor State",
                              _editProfileController.counselorState
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Counselor City",
                              _editProfileController.counselorCity.toString() ??
                                  ""),
                          _buildText(
                              "About Counselor:",
                              _editProfileController.aboutCounselor
                                      .toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Family & More Details",
                      Column(
                        children: [
                          _buildText("Religion",
                              _editProfileController.religion.toString() ?? ""),
                          _buildText("Caste",
                              _editProfileController.caste.toString() ?? ""),
                          _buildText("Subcaste",
                              _editProfileController.subcaste.toString() ?? ""),
                          _buildText("Gotra",
                              _editProfileController.gotra.toString() ?? ""),
                          _buildText(
                              "Language Known",
                              _editProfileController.languageKnown.toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Horoscope Details",
                      Column(
                        children: [
                          _buildText("Date of Birth",
                              _editProfileController.dob.toString() ?? ""),
                          _buildText(
                              "Time of Birth",
                              _editProfileController.timeBirth.toString() ??
                                  ""),
                          _buildText(
                              "State of Birth",
                              _editProfileController.birthState.toString() ??
                                  ""),
                          _buildText(
                              "City of Birth",
                              _editProfileController.birthCity.toString() ??
                                  ""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildText(String tittle, String value) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                tittle,
                style: FontConstant.styleMedium(
                  fontSize: 13,
                  color: AppColors.darkgrey,
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(": "),
            Expanded(
              child: Text(
                value,
                style: FontConstant.styleMedium(
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCont(String tittle, Column column) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: [
              Text(
                tittle,
                style: FontConstant.styleRegular(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  final data = {'goto': 'edit'};
                  Get.toNamed('/prof', arguments: data);
                },
                child: SvgPicture.asset("assets/images/icons/penicon.svg"),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.constColor,
          padding: EdgeInsets.only(
            left: 15,
            right: 25,
            bottom: 15,
            top: 15,
          ),
          child: column,
        ),
      ],
    );
  }
}
