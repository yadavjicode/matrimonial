import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../controller/edit_profile_controller.dart';
import '../../../controller/flow_controller.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/controller/coupons_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../controller/buy_package_controller.dart';
import '../../../controller/package_Controller.dart';
import '../../../controller/skip_controller.dart';
import '../../../model/coupons_model.dart';
import '../../drawer_page/membership_packages/package_comman.dart';

class PackageInformation extends StatefulWidget {
  const PackageInformation({super.key});
  @override
  State<PackageInformation> createState() => _PackageInformationState();
}

class _PackageInformationState extends State<PackageInformation> {
  final CouponsController couponsController = Get.put(CouponsController());
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final FlowController flowController = Get.put(FlowController());
  final PackageController packageController = Get.put(PackageController());
  final BuyPackageController buyPackageController =
      Get.put(BuyPackageController());
  final SkipController skipController = Get.put(SkipController());
  final PackageComman packageComman = Get.put(PackageComman());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      editProfileController.userDetails(context);
      couponsController.coupons(context);
      packageController.package(context);
    });
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
          Obx(() {
            return Stack(children: [
              if (!couponsController.isLoading.value &&
                  !packageController.isLoading.value &&
                  !editProfileController.isLoading.value)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Hare Krishna!",
                            textAlign: TextAlign.center,
                            style: FontConstant.styleSemiBold(
                                fontSize: 14, color: AppColors.primaryColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "With the blessings of Senior Vaisnavas, we are maintaining this application to serve the devotee community, to generate super profits is not the purpose behind this application. But still to maintain this application and to promote it within the devotee community, we also need some funds. So, for that purpose we are keeping a very nominal charge to get register on this application and from time to time we also come up with some offers so that devotee community can take advantage of such offers, you can check that offers in the Coupons/ Offers Section.\n",
                            textAlign: TextAlign.justify,
                            style: FontConstant.styleRegular(
                                fontSize: 14, color: AppColors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Package List",
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 16, color: AppColors.black),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (editProfileController.isLoading.value == false)
                          packageComman.buildPack(editProfileController
                                  .member?.member?.accountType ??
                              0),
                        Text(
                          "\nIf we compare this application with other commercial matrimonial application, then it is more than 85% cheaper than such commercial applications. We are not having multiple kind of packages to confuse the public, we have only 2 versions. One is Free Version and Other one is Premium Version.\n",
                          textAlign: TextAlign.justify,
                          style: FontConstant.styleRegular(
                              fontSize: 14, color: AppColors.black),
                        ),
                        if (packageController.isLoading.value == false)
                          packageDetails()
                      ],
                    ),
                  ),
                ),
              if (couponsController.isLoading.value ||
                  packageController.isLoading.value ||
                  editProfileController.isLoading.value ||
                  skipController.isLoading.value ||
                  flowController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ]);
          })
        ],
      ),
    );
  }

  Widget packageDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 79,
              // color: AppColors.darkblue,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.constColor),
                    child: Image.asset(
                      "assets/images/usergrey.png",
                    ),
                  ),
                  Text(
                    "Free",
                    overflow: TextOverflow.ellipsis,
                    style: FontConstant.styleBold(
                        fontSize: 14, color: AppColors.black),
                  )
                ],
              ),
            ),
            Container(
              // color: AppColors.darkblue,
              width: 79,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.constColor),
                    child: Image.asset(
                      "assets/images/Crown.png",
                    ),
                  ),
                  Text(
                    "Premium",
                    overflow: TextOverflow.ellipsis,
                    style: FontConstant.styleBold(
                        fontSize: 14, color: AppColors.black),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        packageComman.packageSelect(
            context,
            "Able to see photos uploaded on others Profile",
            packageController
                    .member?.data?.free?.ableToSeePhotosOnOthersProfile ??
                0,
            packageController
                    .member?.data?.premium?.ableToSeePhotosOnOthersProfile ??
                0),
        packageComman.packageSelect(context, "Using Shortlist Feature", 1, 1),
        packageComman.packageSelect(
            context,
            "Use Filter/ Sorting Feature",
            packageController.member?.data?.free?.useFilterSortingFeature ?? 0,
            packageController.member?.data?.premium?.useFilterSortingFeature ??
                0),
        packageComman.packageSelect(
            context,
            "View Full Profile of Others",
            packageController.member?.data?.free?.viewFullProfileOfOthers ?? 0,
            packageController.member?.data?.premium?.viewFullProfileOfOthers ??
                0),
        packageComman.packageSelect(
            context,
            "Using Search Feature",
            packageController.member?.data?.free?.usingSearchFeature ?? 0,
            packageController.member?.data?.premium?.usingSearchFeature ?? 0),
        packageComman.packageSelect(
            context,
            "Chat Box",
            packageController.member?.data?.free?.chat ?? 0,
            packageController.member?.data?.premium?.chat! ?? 0),
        packageComman.packageSelect(
            context,
            "See Contact No.s",
            packageController.member?.data?.free?.seeContactNumbers ?? 0,
            packageController.member?.data?.premium?.seeContactNumbers ?? 0),
        packageComman.packageSelect(context, "Using Privacy Features", 0, 1),
        packageComman.packageSelect(
            context, "Respond to received Interest", 0, 1),
        Row(
          children: [
            Expanded(
                child: Text(
              "Send Interest",
              style: FontConstant.styleRegular(
                  fontSize: 12, color: AppColors.black),
            )),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: 79,
                // height: 81,
                alignment: Alignment.center,
                child: Text(
                  "${packageController.member?.data?.free?.sendInterest!.toInt()} Per Day",
                  style: FontConstant.styleBold(
                      fontSize: 12, color: AppColors.green),
                )),
            Container(
                width: 79,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                color: AppColors.constColor,
                alignment: Alignment.center,
                child: Text(
                  "${packageController.member?.data?.premium?.sendInterest!.toInt()} Per Day",
                  style: FontConstant.styleBold(
                      fontSize: 12, color: AppColors.green),
                ))
          ],
        ),
        editProfileController.member?.member?.accountType == 1
            ? Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: CustomButton(
                    text: "Proceed to Next Page",
                    onPressed: () => {flowController.Flow(context, 12)},
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleRegular(
                        fontSize: 16, color: AppColors.constColor)),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    // Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       "Discount Coupons",
                    //       style: FontConstant.styleMedium(
                    //           fontSize: 17, color: AppColors.black),
                    //     )),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: packageComman.buildDiscount(
                        context,
                        couponsController.member?.data ?? [],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: CustomButton(
                          text: "Buy Premium Pack Now",
                          onPressed: () =>
                              {packageComman.appThemeBottomSheet(context)},
                          color: AppColors.primaryColor,
                          textStyle: FontConstant.styleRegular(
                              fontSize: 16, color: AppColors.constColor)),
                    ),
                    GestureDetector(
                      onTap: () =>
                          {skipController.skip(context, "step_12", 20)},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
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
      ],
    );
  }
}
