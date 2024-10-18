import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../controller/html_content_controller.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final HtmlContentController htmlContentController =
      Get.put(HtmlContentController());

  @override
  void initState() {
    super.initState();
    // Fetch HTML content when the widget initializes
    htmlContentController.htmlContent(context);
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
          "Privacy Policy",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/bg3.png")),
          Obx(() {
            if (htmlContentController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else {
              String htmlContent =
                  htmlContentController.member?.data?.privacyPolicy ?? "";

              // Check if the content is empty
              if (htmlContent.isEmpty) {
                return Center(
                    child: Text("No content available.",
                        style: FontConstant.styleMedium(
                            fontSize: 15, color: AppColors.darkgrey)));
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Html(
                    data: htmlContent,
                    style: {
                      "table": Style(
                        backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                      ),
                      "tr": Style(
                        border: const Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                      "th": Style(
                        padding: HtmlPaddings.all(6),
                        backgroundColor: Colors.grey,
                      ),
                      "td": Style(
                        padding: HtmlPaddings.all(6),
                        alignment: Alignment.topLeft,
                      ),
                      "h5": Style(
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    },
                  ),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
