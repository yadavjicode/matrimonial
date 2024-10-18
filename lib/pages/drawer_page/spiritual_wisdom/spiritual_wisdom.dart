import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../controller/html_content_controller.dart';

class SpiritualWisdom extends StatefulWidget {
  const SpiritualWisdom({super.key});

  @override
  State<SpiritualWisdom> createState() => _SpiritualWisdomState();
}

class _SpiritualWisdomState extends State<SpiritualWisdom> {
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
          "Spiritual Wisdom",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/bg3.png"),
          ),
          Obx(() {
            if (htmlContentController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else {
              String htmlContent =
                  htmlContentController.member?.data?.wisdom ?? "";

              // Check if the content is empty
              if (htmlContent.isEmpty) {
                return Center(
                    child: Text("No content available.",
                        style: FontConstant.styleMedium(
                            fontSize: 15, color: AppColors.darkgrey)));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/spirituals.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          DrawerCommanCode().buildTextSemiBold(
                              "Spiritual Wisdom Section for Happy Married Life"),
                          const SizedBox(height: 5),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Html(
                                data: htmlContent,
                                style: {
                                  "table": Style(
                                    backgroundColor:
                                        Color.fromARGB(0x50, 0xee, 0xee, 0xee),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
