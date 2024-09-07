import 'package:carousel_slider/carousel_slider.dart';
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

  int _currentIndex = 0;

  List<String> getImageList() {
    List<String> imgList = [];

    // Check each photo field and add to the list if it's not null
    if (_editProfileController.member?.member?.Photo1 != null) {
      imgList.add(_editProfileController.member!.member!.photo1!);
    }
    if (_editProfileController.member?.member?.photo2 != null) {
      imgList.add(_editProfileController.member!.member!.photo2!);
    }
    if (_editProfileController.member?.member?.photo3 != null) {
      imgList.add(_editProfileController.member!.member!.photo3!);
    }
    if (_editProfileController.member?.member?.photo4 != null) {
      imgList.add(_editProfileController.member!.member!.photo4!);
    }
    if (_editProfileController.member?.member?.photo5 != null) {
      imgList.add(_editProfileController.member!.member!.photo5!);
    }
    return imgList;
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
        automaticallyImplyLeading: false, 
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
    final List<String> imgList = getImageList();
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
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      padEnds: false,
                      aspectRatio: 4 / 5,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: imgList
                        .map((item) => Container(
                              width: double.infinity,
                              child: ClipRRect(
                                child: Image.network(
                                  "http://devoteematrimony.aks.5g.in/${item}",
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 8,
                    child: InkWell(
                      onTap: () => {
                        // Get.toNamed("/profile")
                        Get.toNamed("/editAllPhoto")
                      },
                      child: SvgPicture.asset(
                        "assets/images/icons/penicon.svg",
                        color: Colors.white,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:
                        5.0, // Position the indicator 10 pixels from the bottom
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((url) {
                        int index = imgList.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? AppColors.primaryColor
                                : AppColors.constColor,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              // Container(
              //   alignment: Alignment.center,
              //   height: 305,
              //   width: double.infinity,
              //   color: AppColors.constColor,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         "assets/images/noimage.png",
              //         width: 179,
              //         height: 172,
              //       ),
              //       Text(
              //         "+ Add Image",
              //         style: FontConstant.styleRegular(
              //           fontSize: 23,
              //           color: Color(0xff583689),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
                  "Your profile is ${_editProfileController.member!.profilePercentage ?? ""}% Complete",
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
                    value: (_editProfileController.member!.profilePercentage) /
                        100,
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
                      "/editBasicDetails",
                      Column(
                        children: [
                          _buildText(
                              "Posted by",
                              _editProfileController
                                      .member!.member!.profileFor ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Title",
                              _editProfileController
                                      .member!.member!.nameTitle ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Name",
                              _editProfileController.member!.member!.name ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Surname",
                              _editProfileController.member!.member!.surename ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Spiritual Name",
                              _editProfileController
                                      .member!.member!.spiritualName ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Marital Status",
                              _editProfileController
                                      .member!.member!.maritalstatus ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Height",
                              _editProfileController.member!.member!.height ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Weight",
                              "${_editProfileController.member!.member!.weight} KG" ??
                                  "(Not Mentioned)"),
                          _buildText("Date of Birth",
                              _editProfileController.member!.member!.dOB ?? ""),
                          _buildText(
                              "Hobbies",
                              _editProfileController.member!.member!.hobbies ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Contact Details",
                      "/editContactDetails",
                      Column(
                        children: [
                          _buildText(
                              "Phone Number",
                              _editProfileController.member!.member!.mobile ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Email Address",
                              _editProfileController
                                      .member!.member!.confirmEmail ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Instagram ID",
                              _editProfileController
                                      .member!.member!.instagramId ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Location Details",
                      "/editLocationDetails",
                      Column(
                        children: [
                          _buildText(
                              "Nationality",
                              _editProfileController.member!.member!.country ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Residence Type",
                              _editProfileController.member!.member!.state ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Permanent House Type",
                              _editProfileController
                                      .member!.member!.permanentHouseType ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Permanent State",
                              _editProfileController
                                      .member!.member!.permanentState ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Permanent City",
                              _editProfileController
                                      .member!.member!.permanentCity ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Permanent Pin Code",
                              _editProfileController
                                      .member!.member!.permanentPincode ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Temporary State",
                              _editProfileController
                                      .member!.member!.tempState ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Temporary City",
                              _editProfileController.member!.member!.tempCity ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Temporary Pin Code",
                              _editProfileController
                                      .member!.member!.tempPincode ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 1 Relation",
                              _editProfileController
                                      .member!.member!.reference1Reletion ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 1 Name",
                              _editProfileController
                                      .member!.member!.reference1Name ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 1 Email",
                              _editProfileController
                                      .member!.member!.reference1Email ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 1 Mobile",
                              _editProfileController
                                      .member!.member!.reference1Mobile ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 2 Relation",
                              _editProfileController
                                      .member!.member!.reference2Reletion ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 2 Name",
                              _editProfileController
                                      .member!.member!.reference2Name ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 2 Email",
                              _editProfileController
                                      .member!.member!.reference2Email ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "References 2 Mobile",
                              _editProfileController
                                      .member!.member!.reference2Mobile ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Educational Details",
                      "/profile",
                      Column(
                        children: [
                          _buildText(
                              "Highest Qualification",
                              _editProfileController
                                      .member!.member!.education ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Professional Qualification",
                              _editProfileController.member!.member!
                                      .professionalQualification ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Other Details",
                              _editProfileController
                                      .member!.member!.otherQualification ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Profession Details",
                      "/prof",
                      Column(
                        children: [
                          _buildText(
                              "Profession Tittle",
                              _editProfileController
                                      .member!.member!.occupation ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Employment",
                              _editProfileController
                                      .member!.member!.employedin ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Working State",
                              _editProfileController
                                      .member!.member!.workState ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Working City",
                              _editProfileController.member!.member!.workCity ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Pincode",
                              _editProfileController
                                      .member!.member!.workPincode ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Annual Salary Range",
                              _editProfileController
                                      .member!.member!.annualincome ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Devotional Details",
                      "/editBasicDetails",
                      Column(
                        children: [
                          _buildText(
                              "About Devotional Life",
                              _editProfileController.member!.member!
                                      .somethingAboutYourDevotionalLife ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Iskcon Knowledge",
                              _editProfileController
                                      .member!.member!.iskonType ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "In Which Temple You Are Connected To",
                              _editProfileController.member!.member!
                                      .withWhichTempleYourCounselorIsConnectedTo ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Devotional Habits",
                              _editProfileController
                                      .member!.member!.devotionalHobbies ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Spiritual Counsellor Details",
                      "/editBasicDetails",
                      Column(
                        children: [
                          _buildText(
                              "Connected with Since",
                              _editProfileController.member!.member!
                                      .connectedWithMyCounselerSince ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Connected Temple",
                              _editProfileController
                                      .member!.member!.nameOfTemple ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Counselor State",
                              _editProfileController.member!.member!
                                      .counselorResidingInState ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Counselor City",
                              _editProfileController.member!.member!
                                      .counselorResidingInCity ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "About Counselor:",
                              _editProfileController.member!.member!
                                      .somethingAboutMoreCounselor ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Family & More Details",
                      "/editBasicDetails",
                      Column(
                        children: [
                          _buildText(
                              "Religion",
                              _editProfileController.member!.member!.religion ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Caste",
                              _editProfileController.member!.member!.caste ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Subcaste",
                              _editProfileController.member!.member!.subcaste ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Gotra",
                              _editProfileController.member!.member!.gothram ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Language Known",
                              _editProfileController.member!.member!.language ??
                                  "(Not Mentioned)"),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Horoscope Details",
                      "/editBasicDetails",
                      Column(
                        children: [
                          _buildText(
                              "Date of Birth",
                              _editProfileController.member!.member!.dOB ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "Time of Birth",
                              _editProfileController
                                      .member!.member!.timeOfBirth ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "State of Birth",
                              _editProfileController
                                      .member!.member!.stateOfBirth ??
                                  "(Not Mentioned)"),
                          _buildText(
                              "City of Birth",
                              _editProfileController
                                      .member!.member!.cityOfBirth ??
                                  "(Not Mentioned)"),
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

  Widget _buildCont(String tittle, String move, Column column) {
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
                  
                //   Get.toNamed(move);
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
