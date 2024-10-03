import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../controller/edit_profile_controller.dart';
import '../../../controller/flow_controller.dart';

class PackageInformation extends StatefulWidget {
  const PackageInformation({super.key});

  @override
  State<PackageInformation> createState() => _PackageInformationState();
}

class _PackageInformationState extends State<PackageInformation> {
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController userProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Package Information",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAndToNamed('/profile');
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/bg3.png")),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Hare Krishna!",
                      textAlign: TextAlign.center,
                      style: FontConstant.styleSemiBold(
                          fontSize: 16, color: AppColors.primaryColor),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "With the blessings of Senior Vaisnavas, we are maintaining this application to serve the devotee community, to generate super profits is not the purpose behind this application. But still to maintain this application and to promote it within the devotee community, we also need some funds. So, for that purpose we are keeping a very nominal charge to get register on this application and from time to time we also come up with some offers so that devotee community can take advantage of such offers, you can check that offers in the Coupons/ Offers Section.\n\nIf we compare this application with other commercial matrimonial application, then it is more than 85% cheaper than such commercial applications. We are not having multiple kind of packages to confuse the public, we have only 2 versions. One is Free Version and Other one is Premium Version.",
                      textAlign: TextAlign.center,
                      style: FontConstant.styleRegular(
                          fontSize: 14, color: AppColors.black),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.constColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Free Package",
                                style: FontConstant.styleSemiBold(
                                    fontSize: 16,
                                    color: AppColors.primaryColor)),
                            Container(
                              height: 8,
                              width: 8,
                              margin: EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle),
                            ),
                            Expanded(
                                child: Container(
                              height: 1,
                              width: 200,
                              color: AppColors.primaryColor,
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Get started with essential features like profile creation and basic browsing. Note that the access to the partner preference and partner's desired quality page and many such features is restricted, so you won't be able to set or view detailed criteria for potential matches.",
                            textAlign: TextAlign.justify,
                            style: FontConstant.styleRegular(
                                fontSize: 14, color: AppColors.black)),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.constColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.primaryColor)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/Crown.png"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 5),
                              child: Text("Premium Package",
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 16,
                                      color: AppColors.primaryColor)),
                            ),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle),
                            ),
                            Expanded(
                                child: Container(
                              height: 1,
                              width: 200,
                              color: AppColors.primaryColor,
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Get started with essential features like profile creation and basic browsing. Note that the access to the partner preference and partner's desired quality page and many such features is restricted, so you won't be able to set or view detailed criteria for potential matches.",
                            textAlign: TextAlign.justify,
                            style: FontConstant.styleRegular(
                                fontSize: 14, color: AppColors.black)),
                      ],
                    ),
                  ),
                  Text(
                      "Select the package that best fits your needs to enhance your matrimonial search.",
                      textAlign: TextAlign.center,
                      style: FontConstant.styleRegular(
                          fontSize: 14, color: AppColors.darkgrey)),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text:
                          userProfileController.member?.member?.accountType == 1
                              ? "Proceed to Next Page"
                              : "Select Package",
                      onPressed: () => {
                            if (userProfileController
                                    .member?.member?.accountType ==
                                1)
                              {flowController.Flow(context, 11)}
                            else
                              {Get.toNamed("/membership")}
                          },
                      color: AppColors.primaryColor,
                      textStyle: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.constColor)),
                  GestureDetector(
                    onTap: () => {flowController.Flow(context, 11)},
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Not Now",
                        style: FontConstant.styleRegular(
                            fontSize: 18, color: AppColors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
