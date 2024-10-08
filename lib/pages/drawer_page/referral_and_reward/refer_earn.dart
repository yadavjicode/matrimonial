import 'package:devotee/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../constants/widget/Snackbar.dart';

class ReferEarn extends StatefulWidget {
  const ReferEarn({super.key});

  @override
  State<ReferEarn> createState() => _ReferEarnState();
}

class _ReferEarnState extends State<ReferEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Refer & Earn",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.3,
              color: AppColors.primaryColor,
            ),
            Container(
              margin: const EdgeInsets.only(left: 18, right: 18),
              decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                children: [
                  Stack(children: [
                    Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.constColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Image.asset(
                                    "assets/images/referBanner.png"),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            'Refer to a friend and get ', // The first part of the text
                                        style: FontConstant.styleMedium(
                                            fontSize: 20,
                                            color: AppColors.black),
                                        children: [
                                          TextSpan(
                                            text:
                                                '₹100', // The part that should be red
                                            style: FontConstant.styleMedium(
                                                fontSize: 20,
                                                color: AppColors.primaryColor),
                                          ),
                                          TextSpan(
                                            text:
                                                ' in both the wallets.', // The remaining part of the text
                                            style: FontConstant.styleMedium(
                                                fontSize: 20,
                                                color: AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Referral Code",
                                        style: FontConstant.styleRegular(
                                            fontSize: 16,
                                            color: AppColors.darkgrey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 15),
                                      child: DottedBorder(
                                        color: AppColors.primaryColor,
                                        strokeWidth: 2,
                                        dashPattern: const [4, 4],
                                        borderType: BorderType.RRect,
                                        radius: const Radius.elliptical(5, 5),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: AppColors.background,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "PRAS077",
                                                    style: FontConstant
                                                        .styleMedium(
                                                            fontSize: 15,
                                                            color: AppColors
                                                                .primaryColor),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () => {
                                                    Clipboard.setData(
                                                            const ClipboardData(
                                                                text:
                                                                    "PRAS077"))
                                                        .then((_) {
                                                      Dialogs.showSnackbar(
                                                          context,
                                                          'Copied PRAS077');
                                                    })
                                                  },
                                                  child: Text(
                                                    "Tap To Copy",
                                                    style: FontConstant
                                                        .styleRegular(
                                                            fontSize: 13,
                                                            color: AppColors
                                                                .primaryColor),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        "Enter E-Mail ID or Mobile No.",
                                        style: FontConstant.styleRegular(
                                            fontSize: 16,
                                            color: AppColors.darkgrey),
                                      ),
                                    ),
                                    TextFormField(
                                      // controller: _loginController.mobileno,
                                      // validator: validateInput,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: AppColors.primaryColor),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: AppColors.primaryColor),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            color: AppColors
                                                .primaryColor, // Default border color
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                    Positioned(
                        left: 50,
                        right: 50,
                        bottom: 15,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primaryColor)),
                            onPressed: () => {},
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                "Refer Now",
                                style: FontConstant.styleMedium(
                                    fontSize: 18, color: AppColors.constColor),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset("assets/images/icons/refer.svg")
                            ])))
                  ]),
                  Text(
                    "OR",
                    style: FontConstant.styleMedium(
                        fontSize: 20, color: AppColors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: () {
                        String referralCode = 'PRAS077';
                        String driveLink =
                            'https://drive.google.com/file/d/1N3RVaihzUIu45l9qp3XlQ6QZ6cricEmx/view?usp=drive_link?code=$referralCode';

                        Share.share(driveLink, subject: 'Check out this link');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Share Link",
                            style: FontConstant.styleMedium(
                                fontSize: 18, color: AppColors.primaryColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/images/icons/shareApp.svg",
                              height: 22)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
