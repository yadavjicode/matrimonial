import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/pages_details/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/comman_class_method.dart';

//Start Pages details deatils ==================================================================================================================

class DetailRow extends StatelessWidget {
  final String path;
  final String title;
  final String value;

  DetailRow({
    required this.path,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SvgPicture.asset(path, color: Colors.pink),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontConstant.styleRegular(
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  value,
                  style: FontConstant.styleRegular(
                    fontSize: 12,
                    color: AppColors.darkgrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  TabController? tabController;
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 9, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          // tabAlignment: TabAlignment.start,
          controller: tabController,
          isScrollable: true,
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.primaryColor,
          tabs: const [
            Tab(text: 'Basic Details'),
            Tab(text: 'Contact Details'),
            Tab(text: 'Location Details'),
            Tab(text: 'Educational Details'),
            Tab(text: 'Professional Details'),
            Tab(text: 'Devotional Details'),
            Tab(text: 'Spiritual Counsellor Details'),
            Tab(text: 'Family & More Details'),
            Tab(text: 'Horoscope Details'),
            // Tab(text: "Partner's Desired Qualities"),
            // Tab(text: 'Partner Preferences'),
          ],
        ),
        SizedBox(
          height: 300,
          child: Obx(() {
            // start basicDetails ========================================================================================================================================================================

            List<Map<String, String>> basicDetails = [
              {
                "title": "Name",
                "value":
                    "${profileDetailsController.member?.data?.nameTitle ?? ""} ${profileDetailsController.member?.data?.name ?? ""} ${profileDetailsController.member?.data?.surename ?? ""}"
              },
              {
                "title": "Initiated Name (Spiritual Name)",
                "value":
                    "${profileDetailsController.member?.data?.spiritualName ?? "Not Mentioned"}"
              },
              {
                "title": "Marital Status",
                "value":
                    "${profileDetailsController.member?.data?.maritalstatus ?? "Not Mentioned"}"
              },
              {
                "title": "Height",
                "value":
                    "${profileDetailsController.member?.data?.height ?? "Not Mentioned"}"
              },
              {
                "title": "Weight",
                "value":
                    "${profileDetailsController.member?.data?.weight != null ? "${profileDetailsController.member?.data?.weight} KG" : "Not Mentioned"}"
              },
              {
                "title": "Date of Birth",
                "value": CommanClass.dateFormat(
                            profileDetailsController.member?.data?.dOB)
                        .isEmpty
                    ? "Not Mentioned"
                    : CommanClass.dateFormat(
                        profileDetailsController.member?.data?.dOB)
              },
              {
                "title": "Hobbies",
                "value":
                    "${profileDetailsController.member?.data?.hobbies ?? "Not Mentioned"}"
              },
              {
                "title": "Diet",
                "value":
                    "${profileDetailsController.member?.data?.diet ?? "Not Mentioned"}"
              },
              {
                "title": "About ",
                "value":
                    "${profileDetailsController.member?.data?.about ?? "Not Mentioned"}"
              }
            ];
// End basicDetails ========================================================================================================================================================================

// Start contactDetails ========================================================================================================================================================================

            List<Map<String, String>> contactDetails = [
              {
                "title": "Phone Number",
                "value": profileDetailsController.member?.data?.chatStatus == 1
                    ? profileDetailsController.member?.data?.hidePhoneStatus ==
                            1
                        ? "Hidden"
                        : "${profileDetailsController.member?.data?.mobile != null ? "+" : ""}${profileDetailsController.member?.data?.mobile ?? "Not Mentioned"}"
                    : "+${profileDetailsController.member?.data?.mobile != null ? profileDetailsController.member?.data?.mobile.toString().substring(0, 4) : "****"}**********"
              },
              {
                "title": "Email Address",
                "value":
                    "${profileDetailsController.member?.data?.chatStatus == 1 ? profileDetailsController.member?.data?.hideEmailStatus == 1 ? "Hidden" : profileDetailsController.member?.data?.confirmEmail ?? "Not Mentioned" : "***********@gmail.com"}"
              },
              {
                "title": "Instagram ID",
                "value":
                    "${profileDetailsController.member?.data?.chatStatus == 1 ? profileDetailsController.member?.data?.instagramId ?? "Not Mentioned" : "**************"}"
              }
            ];
// End contactDetails ========================================================================================================================================================================

// Start locationDetails ========================================================================================================================================================================

            List<Map<String, String>> locationDetails = [
              {
                "title": "Nationality",
                "value":
                    "${profileDetailsController.member?.data?.country ?? "Not Mentioned"}"
              },
              {
                "title": "Residence Type",
                "value":
                    "${profileDetailsController.member?.data?.residencystatus ?? "Not Mentioned"}"
              },
              {
                "title": "Permanent House Type",
                "value":
                    "${profileDetailsController.member?.data?.permanentHouseType ?? "Not Mentioned"}"
              },
              {
                "title": "Permanent State",
                "value":
                    "${profileDetailsController.member?.data?.permanentState ?? "Not Mentioned"}"
              },
              {
                "title": "Permanent City",
                "value":
                    "${profileDetailsController.member?.data?.permanentCity ?? "Not Mentioned"}"
              },
              {
                "title": "Permanent Pin Code/ ZIP Code",
                "value":
                    "${profileDetailsController.member?.data?.permanentPincode ?? "Not Mentioned"}"
              },
              {
                "title": "Temporary State",
                "value":
                    "${profileDetailsController.member?.data?.tempState ?? "Not Mentioned"}"
              },
              {
                "title": "Temporary City",
                "value":
                    "${profileDetailsController.member?.data?.tempCity ?? "Not Mentioned"}"
              },
              {
                "title": "Temporary Pin Code/ ZIP Code",
                "value":
                    "${profileDetailsController.member?.data?.tempPincode ?? "Not Mentioned"}"
              },
              {
                "title": "References 1 Relation",
                "value":
                    "${profileDetailsController.member?.data?.reference1Reletion ?? "Not Mentioned"}"
              },
              {
                "title": "References 1 Name",
                "value":
                    "${profileDetailsController.member?.data?.reference1Name ?? "Not Mentioned"}"
              },
              {
                "title": "References 1 Email",
                "value":
                    "${profileDetailsController.member?.data?.chatStatus == 1 ? profileDetailsController.member?.data?.reference1Email ?? "Not Mentioned" : "***********@gmail.com"}"
              },
              {
                "title": "References 1 Mobile no",
                "value":
                    "${profileDetailsController.member?.data?.chatStatus == 1 ? profileDetailsController.member?.data?.reference1Mobile ?? "Not Mentioned" : "${profileDetailsController.member?.data?.reference1Mobile != null ? profileDetailsController.member?.data?.reference1Mobile.toString().substring(0, 4) : "****"}**********"}"
              },
              {
                "title": "References 2 Relation",
                "value":
                    "${profileDetailsController.member?.data?.reference2Reletion ?? "Not Mentioned"}"
              },
              {
                "title": "References 2 Name",
                "value":
                    "${profileDetailsController.member?.data?.reference2Name ?? "Not Mentioned"}"
              },
              {
                "title": "References 2 Email",
                "value":
                    "${profileDetailsController.member?.data?.chatStatus == 1 ? profileDetailsController.member?.data?.reference2Email ?? "Not Mentioned" : "***********@gmail.com"}"
              },
              {
                "title": "References 2 Mobile no",
                "value":
                    "${profileDetailsController.member?.data?.chatStatus == 1 ? profileDetailsController.member?.data?.reference2Mobile ?? "Not Mentioned" : "${profileDetailsController.member?.data?.reference2Mobile != null ? profileDetailsController.member?.data?.reference2Mobile.toString().substring(0, 4) : "****"}**********"}"
              },
            ];
            // End locationDetails ========================================================================================================================================================================

            // Start educationDetails ========================================================================================================================================================================

            List<Map<String, String>> educationDetails = [
              {
                "title": "Highest Qualification",
                "value":
                    "${profileDetailsController.member?.data?.education ?? "Not Mentioned"}"
              },
              {
                "title": "Professional Qualification",
                "value":
                    "${profileDetailsController.member?.data?.professionalQualification ?? "Not Mentioned"}"
              },
              {
                "title": "Describe other qualifications (if any)",
                "value":
                    "${profileDetailsController.member?.data?.otherProfrsionQualification ?? "Not Mentioned"}"
              }
            ];
            // End educationDetails ========================================================================================================================================================================

            // Start professionalDetails ========================================================================================================================================================================

            List<Map<String, String>> professionalDetails = [];

            if (profileDetailsController.member?.data?.workingAnywhere ==
                "Yes") {
              professionalDetails.addAll([
                {
                  "title": "Title of the Profession",
                  "value":
                      "${profileDetailsController.member?.data?.occupation ?? "Not Mentioned"}"
                },
                {
                  "title": "Working anywhere",
                  "value":
                      "${profileDetailsController.member?.data?.workingAnywhere ?? "Not Mentioned"}"
                },
                {
                  "title": "Employment",
                  "value":
                      "${profileDetailsController.member?.data?.employedin ?? "Not Mentioned"}"
                },
                {
                  "title": "Working State",
                  "value":
                      "${profileDetailsController.member?.data?.workState ?? "Not Mentioned"}"
                },
                {
                  "title": "Working City",
                  "value":
                      "${profileDetailsController.member?.data?.workCity ?? "Not Mentioned"}"
                },
                {
                  "title": "Working Pin Code/ ZIP Code",
                  "value":
                      "${profileDetailsController.member?.data?.workPincode ?? "Not Mentioned"}"
                },
                {
                  "title": "Annual Income Range",
                  "value":
                      "${profileDetailsController.member?.data?.annualincome ?? "Not Mentioned"}"
                },
              ]);
            } else {
              professionalDetails.addAll([
                {
                  "title": "Title of the Profession",
                  "value":
                      "${profileDetailsController.member?.data?.occupation ?? "Not Mentioned"}"
                },
                {
                  "title": "Working anywhere",
                  "value":
                      "${profileDetailsController.member?.data?.workingAnywhere ?? "Not Mentioned"}"
                },
              ]);
            }

            // End professionalDetails ========================================================================================================================================================================

            // Start devotionalDetails ========================================================================================================================================================================

            List<Map<String, String>> devotionalDetails = [
              {
                "title": "Something about your Devotional Life",
                "value":
                    "${profileDetailsController.member?.data?.somethingAboutYourDevotionalLife ?? "Not Mentioned"}"
              },
              {
                "title": "Iskcon Knowledge",
                "value":
                    "${profileDetailsController.member?.data?.iskonType ?? "Not Mentioned"}"
              },
              {
                "title": "Name of spiritual master",
                "value":
                    "${profileDetailsController.member?.data?.dikshaGuru ?? "Not Mentioned"}"
              },
              {
                "title": "With which temple you are connected to",
                "value":
                    "${profileDetailsController.member?.data?.withWhichTempleYourCounselorIsConnectedTo ?? "Not Mentioned"}"
              },
              {
                "title": "City of temple",
                "value":
                    "${profileDetailsController.member?.data?.cityOfTheTemple ?? "Not Mentioned"}"
              },
              {
                "title": "Which Sampradaya you belong to?",
                "value":
                    "${profileDetailsController.member?.data?.whichsampradaya ?? "Not Mentioned"}"
              },
              {
                "title": "Devotional Hobbies",
                "value":
                    "${profileDetailsController.member?.data?.devotionalHobbies ?? "Not Mentioned"}"
              }
            ];

            // End devotionalDetails ========================================================================================================================================================================

            // Start spiritualDetails ========================================================================================================================================================================

            List<Map<String, String>> spiritualDetails = [];

            if (profileDetailsController.member?.data?.spiritualConnected ==
                "Yes") {
              spiritualDetails.addAll([
                {
                  "title": "connected with any Spirtual Counsellor",
                  "value":
                      "${profileDetailsController.member?.data?.spiritualConnected ?? "Not Mentioned"}"
                },
                {
                  "title": "Name of the Counsellor for my Spiritual Path",
                  "value":
                      "${profileDetailsController.member?.data?.nameOfTheCounselorOfMySpiritualPath ?? "Not Mentioned"}"
                },
                {
                  "title": "Connected with my Counsellor Since (Year)",
                  "value":
                      "${profileDetailsController.member?.data?.connectedWithMyCounselerSince ?? "Not Mentioned"}"
                },
                {
                  "title": "With which temple your Counsellor is connected to?",
                  "value":
                      "${profileDetailsController.member?.data?.withWhichTempleYourCounselorIsConnectedTo ?? "Not Mentioned"}"
                },
                {
                  "title": "Counsellor residing in State",
                  "value":
                      "${profileDetailsController.member?.data?.counselorResidingInState ?? "Not Mentioned"}"
                },
                {
                  "title": "Counsellor residing in City",
                  "value":
                      "${profileDetailsController.member?.data?.counselorResidingInCity ?? "Not Mentioned"}"
                },
                {
                  "title": "Something more about the Counsellor",
                  "value":
                      "${profileDetailsController.member?.data?.somethingAboutMoreCounselor ?? "Not Mentioned"}"
                }
              ]);
            } else {
              spiritualDetails.addAll([
                {
                  "title": "connected with any Spirtual Counsellor",
                  "value":
                      "${profileDetailsController.member?.data?.spiritualConnected ?? "Not Mentioned"}"
                },
              ]);
            }
            // End spiritualDetails ========================================================================================================================================================================

            // Start familyDetails ========================================================================================================================================================================

            List<Map<String, String>> familyDetails = [
              {
                "title": "Religion",
                "value":
                    "${profileDetailsController.member?.data?.religion ?? "Not Mentioned"}"
              },
              {
                "title": "Caste",
                "value":
                    "${profileDetailsController.member?.data?.caste ?? "Not Mentioned"}"
              },
              {
                "title": "Subcaste",
                "value":
                    "${profileDetailsController.member?.data?.subcaste ?? "Not Mentioned"}"
              },
              {
                "title": "Gotra",
                "value":
                    "${profileDetailsController.member?.data?.gothram ?? "Not Mentioned"}"
              },
              {
                "title": "Languages Known",
                "value":
                    "${profileDetailsController.member?.data?.language ?? "Not Mentioned"}"
              },
              {
                "title": "Mother Tongue",
                "value":
                    "${profileDetailsController.member?.data?.pEMotherTongue ?? "Not Mentioned"}"
              },
            ];
            if (profileDetailsController.member?.data?.fatherlivingstatus ==
                "Yes") {
              familyDetails.addAll([
                {
                  "title": "Father Alive",
                  "value":
                      "${profileDetailsController.member?.data?.fatherlivingstatus ?? "Not Mentioned"}"
                },
                {
                  "title": "Full Name of Father",
                  "value":
                      "${profileDetailsController.member?.data?.fathername ?? "Not Mentioned"}"
                },
                {
                  "title": "Father Occupation",
                  "value":
                      "${profileDetailsController.member?.data?.fathersoccupation ?? "Not Mentioned"}"
                },
                {
                  "title": "Father Business",
                  "value":
                      "${profileDetailsController.member?.data?.fatherBussness ?? "Not Mentioned"}"
                },
                {
                  "title": "Father Annual Income Range",
                  "value":
                      "${profileDetailsController.member?.data?.fatherAnnualIncome ?? "Not Mentioned"}"
                },
              ]);
            } else {
              familyDetails.addAll([
                {
                  "title": "Father Alive",
                  "value":
                      "${profileDetailsController.member?.data?.fatherlivingstatus ?? "Not Mentioned"}"
                },
              ]);
            }

            if (profileDetailsController.member?.data?.motherlivingstatus ==
                "Yes") {
              familyDetails.addAll([
                {
                  "title": "Mother Alive",
                  "value":
                      "${profileDetailsController.member?.data?.motherlivingstatus ?? "Not Mentioned"}"
                },
                {
                  "title": "Full Name of Mother",
                  "value":
                      "${profileDetailsController.member?.data?.mothersname ?? "Not Mentioned"}"
                },
                {
                  "title": "Mother Occupation",
                  "value":
                      "${profileDetailsController.member?.data?.mothersoccupation ?? "Not Mentioned"}"
                },
                {
                  "title": "Mother Annual Income Range",
                  "value":
                      "${profileDetailsController.member?.data?.motherAnnualIncome ?? "Not Mentioned"}"
                },
              ]);
            } else {
              familyDetails.addAll([
                {
                  "title": "Mother Alive",
                  "value":
                      "${profileDetailsController.member?.data?.motherlivingstatus ?? "Not Mentioned"}"
                },
              ]);
            }

            if (profileDetailsController.member?.data?.brother == "Yes") {
              familyDetails.addAll([
                {
                  "title": "Brother",
                  "value":
                      "${profileDetailsController.member?.data?.brother ?? "Not Mentioned"}"
                },
                {
                  "title": "Number of Brother",
                  "value":
                      "${profileDetailsController.member?.data?.noofbrothers ?? "Not Mentioned"}"
                },
              ]);
            } else {
              familyDetails.addAll([
                {
                  "title": "Brother",
                  "value":
                      "${profileDetailsController.member?.data?.brother ?? "Not Mentioned"}"
                },
              ]);
            }

            if (profileDetailsController.member?.data?.sister == "Yes") {
              familyDetails.addAll([
                {
                  "title": "Sister",
                  "value":
                      "${profileDetailsController.member?.data?.sister ?? "Not Mentioned"}"
                },
                {
                  "title": "Number of Sisters",
                  "value":
                      "${profileDetailsController.member?.data?.noofsisters ?? "Not Mentioned"}"
                },
              ]);
            } else {
              familyDetails.addAll([
                {
                  "title": "Sister",
                  "value":
                      "${profileDetailsController.member?.data?.sister ?? "Not Mentioned"}"
                },
              ]);
            }

            familyDetails.addAll([
              {
                "title": "Family Type",
                "value":
                    "${profileDetailsController.member?.data?.familyType ?? "Not Mentioned"}"
              },
              {
                "title": "Family Value",
                "value":
                    "${profileDetailsController.member?.data?.familyvalues ?? "Not Mentioned"}"
              },
              {
                "title": "Affluence Level",
                "value":
                    "${profileDetailsController.member?.data?.familyStatus ?? "Not Mentioned"}"
              },
            ]);

            // End familyDetails ========================================================================================================================================================================

            // // Start aboutDetails ========================================================================================================================================================================

            // List<Map<String, String>> aboutDetails = [
            //   {
            //     "title":
            //         "${profileDetailsController.member!.data!.gender == "Male" ? "About Bride" : "About Groom"}",
            //     "value":
            //         "${profileDetailsController.member!.data!.groomBride ?? "Not Mentioned"}"
            //   },
            //   {
            //     "title": "Hobbies or Likings",
            //     "value":
            //         "${profileDetailsController.member!.data!.hobbies ?? "Not Mentioned"}"
            //   },
            // ];
            // // End aboutDetails ========================================================================================================================================================================

            // Start horoscopeDetails ========================================================================================================================================================================

            List<Map<String, String>> horoscopeDetails = [
              {
                "title": "Time Of Birth",
                "value":
                    "${profileDetailsController.member?.data?.hideAstroStatus == 1 ? "Hidden" : profileDetailsController.member?.data?.timeOfBirth ?? "Not Mentioned"}"
              },
              {
                "title": "Country Of Birth",
                "value":
                    "${profileDetailsController.member?.data?.hideAstroStatus == 1 ? "Hidden" : profileDetailsController.member?.data?.countryOfBirth ?? "Not Mentioned"}"
              },
              {
                "title": "State of Birth",
                "value":
                    "${profileDetailsController.member?.data?.hideAstroStatus == 1 ? "Hidden" : profileDetailsController.member?.data?.stateOfBirth ?? "Not Mentioned"}"
              },
              {
                "title": "City of Birth",
                "value":
                    "${profileDetailsController.member?.data?.hideAstroStatus == 1 ? "Hidden" : profileDetailsController.member?.data?.cityOfBirth ?? "Not Mentioned"}"
              },
            ];
// End horoscopeDetails ========================================================================================================================================================================

// // Start preferencesDetails ========================================================================================================================================================================

//     List<Map<String, String>> preferencesDetails = [
//       {
//         "title": "Age Range",
//         "value":
//             "${profileDetailsController.member!.data!.pEFromAge != null || profileDetailsController.member!.data!.pEToAge != null ? "${profileDetailsController.member!.data!.pEFromAge ?? ""} - ${profileDetailsController.member!.data!.pEToAge ?? ""} Years" : "Not Mentioned"}"
//       },
//       {
//         "title": "Weight Range",
//         "value":
//             "${profileDetailsController.member!.data!.pEFromWeight != null || profileDetailsController.member!.data!.pEToWeight != null ? "${profileDetailsController.member!.data!.pEFromWeight ?? ""} - ${profileDetailsController.member!.data!.pEToWeight ?? ""} KG" : "Not Mentioned"}"
//       },
//       {
//         "title": "Height Range",
//         "value":
//             "${profileDetailsController.member!.data!.pEHeight != null || profileDetailsController.member!.data!.pEHeight2 != null ? "${profileDetailsController.member!.data!.pEHeight ?? ""} - ${profileDetailsController.member!.data!.pEHeight2 ?? ""}" : "Not Mentioned"}"
//       },
//       {
//         "title": "Languages Known",
//         "value":
//             "${profileDetailsController.member!.data!.pELanguage ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Marital Status",
//         "value":
//             "${profileDetailsController.member!.data!.pEMaritalStatus ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Family Type",
//         "value":
//             "${profileDetailsController.member!.data!.pEFamilyType ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Family Value",
//         "value":
//             "${profileDetailsController.member!.data!.pEFamilyValue ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Nationality",
//         "value":
//             "${profileDetailsController.member!.data!.pECountrylivingin ?? "Not Mentioned"}"
//       },
//       {
//         "title": "State",
//         "value":
//             "${profileDetailsController.member!.data!.pEState ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Highest Qualification",
//         "value":
//             "${profileDetailsController.member!.data!.pEEducation ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Professional Qualification",
//         "value":
//             "${profileDetailsController.member!.data!.pEProfessional ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Occupation",
//         "value":
//             "${profileDetailsController.member!.data!.pEOccupation ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Annual Income Range",
//         "value":
//             "${profileDetailsController.member!.data!.pEAnnualincome ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Religion",
//         "value":
//             "${profileDetailsController.member!.data!.pEReligion ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Caste",
//         "value":
//             "${profileDetailsController.member!.data!.pECaste ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Diet Preference",
//         "value":
//             "${profileDetailsController.member!.data!.pEDiet ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Drinking Habit",
//         "value":
//             "${profileDetailsController.member!.data!.pEDrink ?? "Not Mentioned"}"
//       },
//       {
//         "title": "Smoking Habit",
//         "value":
//             "${profileDetailsController.member!.data!.pESmoking ?? "Not Mentioned"}"
//       },
//     ];
//     // End preferencesDetails ========================================================================================================================================================================
            return profileDetailsController.isLoading.value == false
                ? TabBarView(
                    controller: tabController,
                    children: [
                      CustomPage(customContent: basicDetails),
                      CustomPage(customContent: contactDetails),
                      CustomPage(customContent: locationDetails),
                      CustomPage(customContent: educationDetails),
                      CustomPage(customContent: professionalDetails),
                      CustomPage(customContent: devotionalDetails),
                      CustomPage(customContent: spiritualDetails),
                      CustomPage(customContent: familyDetails),
                      CustomPage(customContent: horoscopeDetails),
                      // CustomPage(customContent: aboutDetails),
                      // CustomPage(customContent: preferencesDetails),
                    ],
                  )
                : const SizedBox.shrink();
          }),
        ),
      ],
    );
  }
}
//End Pages details deatils ==================================================================================================================
