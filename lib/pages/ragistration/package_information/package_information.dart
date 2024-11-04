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
                          _buildPack(editProfileController
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
                  skipController.isLoading.value)
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
        _packageSelect(
            context,
            "Able to see photos uploaded on others Profile",
            packageController
                    .member?.data?.free?.ableToSeePhotosOnOthersProfile ??
                0,
            packageController
                    .member?.data?.premium?.ableToSeePhotosOnOthersProfile ??
                0),
        _packageSelect(context, "Using Shortlist Feature", 1, 1),
        _packageSelect(
            context,
            "Use Filter/ Sorting Feature",
            packageController.member?.data?.free?.useFilterSortingFeature ?? 0,
            packageController.member?.data?.premium?.useFilterSortingFeature ??
                0),
        _packageSelect(
            context,
            "View Full Profile of Others",
            packageController.member?.data?.free?.viewFullProfileOfOthers ?? 0,
            packageController.member?.data?.premium?.viewFullProfileOfOthers ??
                0),
        _packageSelect(
            context,
            "Using Search Feature",
            packageController.member?.data?.free?.usingSearchFeature ?? 0,
            packageController.member?.data?.premium?.usingSearchFeature ?? 0),
        _packageSelect(
            context,
            "Chat Box",
            packageController.member?.data?.free?.chat ?? 0,
            packageController.member?.data?.premium?.chat! ?? 0),
        _packageSelect(
            context,
            "See Contact No.s",
            packageController.member?.data?.free?.seeContactNumbers ?? 0,
            packageController.member?.data?.premium?.seeContactNumbers ?? 0),
        _packageSelect(context, "Using Privacy Features", 0, 1),
        _packageSelect(context, "Respond to received Interest", 0, 1),
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
                      child: _buildDiscount(
                        context,
                        couponsController.member?.data ?? [],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: CustomButton(
                          text: "Buy Premium Pack Now",
                          onPressed: () => {
                                buyPackageController.buyPackage(context,false)
                                //  Get.toNamed("/package")
                              },
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

Widget _buildPack(int package) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: package != 1
                    ? AppColors.constColor
                    : AppColors.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    "Free Pack",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: FontConstant.styleSemiBold(
                      fontSize: 16,
                      color:
                          package != 1 ? AppColors.black : AppColors.constColor,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          package != 1 ? AppColors.grey : AppColors.constColor,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: package == 1
                                  ? AppColors.grey
                                  : AppColors.primaryColor,
                            ),
                            child: package != 1
                                ? SvgPicture.asset(
                                    "assets/images/icons/correct.svg")
                                : Container(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              package != 1 ? "Current Pack" : "Select Pack",
                              style: FontConstant.styleRegular(
                                  fontSize: 12,
                                  color: package != 1
                                      ? AppColors.constColor
                                      : AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: package == 1
                    ? AppColors.constColor
                    : AppColors.primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/Crown.png",
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          "Premium Pack",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: FontConstant.styleSemiBold(
                              fontSize: 16,
                              color: package == 1
                                  ? AppColors.black
                                  : AppColors.constColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          package == 1 ? AppColors.grey : AppColors.constColor,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: package != 1
                                    ? AppColors.grey
                                    : AppColors.primaryColor,
                              ),
                              child: package == 1
                                  ? SvgPicture.asset(
                                      "assets/images/icons/correct.svg")
                                  : Container()),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              package == 1 ? "Current Pack" : "Select Pack",
                              style: FontConstant.styleRegular(
                                  fontSize: 12,
                                  color: package == 1
                                      ? AppColors.constColor
                                      : AppColors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDiscount(BuildContext context, List<Data> list) {
  return Column(
    children: list.map((data) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppColors.constColor,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 35.0, // Adjust the radius as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data.discount}%",
                      style: FontConstant.styleMedium(
                        fontSize: 18,
                        color: AppColors.constColor,
                      ),
                      maxLines: 1, // Limits to one line
                      overflow:
                          TextOverflow.ellipsis, // Adds ellipsis for overflow
                      textAlign: TextAlign.center,
                    ),
                    // Adds space between the two texts
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "Discount",
                        style: FontConstant.styleMedium(
                          fontSize: 10,
                          color: AppColors.constColor,
                        ),
                        maxLines: 1, // Limits to one line
                        overflow:
                            TextOverflow.ellipsis, // Adds ellipsis for overflow
                        textAlign: TextAlign
                            .center, // Center the text inside the circle
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New Users ${data.gender == "Male" ? "Boy" : "Girl"}",
                      style: FontConstant.styleSemiBold(
                          fontSize: 15, color: AppColors.black),
                      maxLines: 1, // Limits to one line
                      overflow:
                          TextOverflow.ellipsis, // Adds ellipsis for overflow
                    ),
                    Text(
                      "Get ${data.discount}% Discount upto ₹${data.discount} for the first ${data.noOfUser} boys",
                      style: FontConstant.styleRegular(
                          fontSize: 10, color: AppColors.black),
                      maxLines: 2, // Limits to one line
                      overflow:
                          TextOverflow.ellipsis, // Adds ellipsis for overflow
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                  color: AppColors.darkblue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: GestureDetector(
                onTap: () => {
                  Clipboard.setData(ClipboardData(text: data.couponName))
                      .then((_) {
                    Dialogs.showSnackbar(context, 'Copied ${data.couponName}');
                  })
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.couponName,
                        style: FontConstant.styleBold(
                            fontSize: 13, color: AppColors.constColor),
                      ),
                      SvgPicture.asset("assets/images/icons/copy.svg"),
                      Text(
                        "COPY",
                        style: FontConstant.styleMedium(
                            fontSize: 12, color: AppColors.constColor),
                      )
                    ]),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}

Widget _packageSelect(
    BuildContext context, String tittle, int free, int premium) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
              child: Text(
            tittle,
            style:
                FontConstant.styleRegular(fontSize: 12, color: AppColors.black),
          )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              alignment: Alignment.center,
              child: free == 1
                  ? Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                      ),
                      child:
                          SvgPicture.asset("assets/images/icons/correct.svg"))
                  : Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.red),
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: AppColors.constColor,
                      ),
                    )),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              color: AppColors.constColor,
              alignment: Alignment.center,
              child: premium == 1
                  ? Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                      ),
                      child:
                          SvgPicture.asset("assets/images/icons/correct.svg"))
                  : Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.red),
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: AppColors.constColor,
                      ),
                    ))
        ],
      ),
      Container(
        height: 1,
        color: AppColors.grey,
      )
    ],
  );
}
