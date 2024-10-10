import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomPage extends StatefulWidget {
  final List<Map<String, String>> customContent;
  const CustomPage({super.key, required this.customContent});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
      
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: widget.customContent.map((data) {
              return pageContent().dataContent(
                data['title'] ?? 'Not Mentioned', // Access the title from the map
                data['value'] ?? 'Not Mentioned',
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class pageContent {
  Widget dataContent(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
          color: AppColors.constColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              title,
              style: FontConstant.styleRegular(
                  fontSize: 13, color: AppColors.black),
            )),
            const Text(" : "),
            Expanded(
                child: Text("${value}",
                    style: FontConstant.styleRegular(
                        fontSize: 13, color: AppColors.black)))
          ],
        ),
      ),
    );
  }
}


// class LifeStyle extends StatefulWidget {
//   const LifeStyle({super.key});

//   @override
//   State<LifeStyle> createState() => _LifeStyleState();
// }
// class _LifeStyleState extends State<LifeStyle> {
//   ProfileDetailsController profileDetailsController =
//       Get.put(ProfileDetailsController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               AboutContent().dataContent("Diet Preference",
//                   "${profileDetailsController.member!.data!.diet ?? ""}"),
//               AboutContent().dataContent("Drinking Habit", ""),
//               AboutContent().dataContent("Smoking Habit", "")
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BackgroundDetails extends StatefulWidget {
//   const BackgroundDetails({super.key});

//   @override
//   State<BackgroundDetails> createState() => _BackgroundDetailsState();
// }

// class _BackgroundDetailsState extends State<BackgroundDetails> {
//   ProfileDetailsController profileDetailsController =
//       Get.put(ProfileDetailsController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               AboutContent().dataContent("Languages Known",
//                   "${profileDetailsController.member!.data!.language ?? ""}"),
//               AboutContent().dataContent("Mother Tongue",
//                   "${profileDetailsController.member!.data!.motherTongue ?? ""}"),
//               AboutContent().dataContent("Religion",
//                   "${profileDetailsController.member!.data!.religion ?? ""}"),
//               AboutContent().dataContent("Caste",
//                   "${profileDetailsController.member!.data!.caste ?? ""}"),
//               AboutContent().dataContent("Father Name",
//                   "${profileDetailsController.member!.data!.fathername ?? ""}"),
//               AboutContent().dataContent("Mother Name",
//                   "${profileDetailsController.member!.data!.mothersname ?? ""}"),
//               AboutContent().dataContent("Borther",
//                   "${profileDetailsController.member!.data!.noofbrothers ?? ""}"),
//               AboutContent().dataContent("Sister ",
//                   "${profileDetailsController.member!.data!.noofsisters ?? ""}"),
//               AboutContent().dataContent("Marital Status",
//                   "${profileDetailsController.member!.data!.maritalstatus ?? ""}"),
//               AboutContent().dataContent("Lives in",
//                   "${profileDetailsController.member!.data!.permanentCity ?? ""}, ${profileDetailsController.member!.data!.permanentState ?? ""}"),
//               AboutContent().dataContent("ABOUT GROOM/BRIDE",
//                   "${profileDetailsController.member!.data!.groomBride ?? ""}"),
//               AboutContent().dataContent("Hobbies or Likings",
//                   "${profileDetailsController.member!.data!.hobbies ?? ""}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Contact extends StatefulWidget {
//   const Contact({super.key});

//   @override
//   State<Contact> createState() => _ContactState();
// }

// class _ContactState extends State<Contact> {
//   ProfileDetailsController profileDetailsController =
//       Get.put(ProfileDetailsController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               AboutContent().dataContent("Contact Number",
//                   "${profileDetailsController.member!.data!.mobile ?? ""}"),
//               AboutContent().dataContent("Email",
//                   "${profileDetailsController.member!.data!.confirmEmail ?? ""}"),
//               AboutContent().dataContent("Instagram ID",
//                   "${profileDetailsController.member!.data!.instagramId ?? ""}"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Professional extends StatefulWidget {
//   const Professional({super.key});

//   @override
//   State<Professional> createState() => _ProfessionalState();
// }

// class _ProfessionalState extends State<Professional> {
//   ProfileDetailsController profileDetailsController =
//       Get.put(ProfileDetailsController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               AboutContent().dataContent("Highest Education",
//                   "${profileDetailsController.member!.data!.education ?? ""}"),
//               AboutContent().dataContent("Employee",
//                   "${profileDetailsController.member!.data!.workingAnywhere ?? ""}"),
//               AboutContent().dataContent("Professional Qualification",
//                   "${profileDetailsController.member!.data!.professionalQualification ?? ""}"),
//               AboutContent().dataContent("Annual Salary Range",
//                   "${profileDetailsController.member!.data!.annualincome ?? ""}")
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


