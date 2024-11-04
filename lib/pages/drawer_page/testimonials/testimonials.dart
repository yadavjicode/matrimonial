import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/testimonial_controller.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/widget/star_rating.dart';

class Testimonial extends StatefulWidget {
  const Testimonial({super.key});

  @override
  State<Testimonial> createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {
  String selectedText = "";
  int selectedIndex = -1;

  final TestimonialController testimonialController =
      Get.put(TestimonialController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      testimonialController.testimonial(context);
    });
    super.initState();
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
          "Testimonials",
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
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset("assets/images/testimonial.png",
                    fit: BoxFit.cover),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: CustomDrawerButton(
                    color: AppColors.primaryColor,
                    text: "Add Testimonial",
                    onPressed: () => {Get.toNamed("/addTestimonials")},
                    textStyle: FontConstant.styleRegular(
                        fontSize: 14, color: AppColors.constColor),
                  )
                  ),
              Obx(() {
                return Expanded(
                  child: Stack(
                    children: [
                      if (testimonialController.isLoading.value == false)
                        testimonialContent(),
                      if (testimonialController.isLoading.value)
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                    ],
                  ),
                );
              })
            ],
          )
        ],
      ),
    );
  }

  Widget testimonialContent() {
    if (testimonialController.member == null ||
        testimonialController.member?.data == null) {
      return Center(
        child: Text("No testimonials available",
            style: FontConstant.styleMedium(
                fontSize: 15, color: AppColors.darkgrey)),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: testimonialController.member!.data!.map((data) {
              String name = data.name ?? "";
              String profile = data.designation ?? "";
              int rating = data.rating ?? 0;
              String feedback = data.description ?? "";
              String image = data.image != null
                  ? "http://devoteematrimony.aks.5g.in/${data.image}"
                  : "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";

              return GestureDetector(
                onTap: () {
                  // Get.toNamed('/profiledtls');
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey),
                              child: ClipOval(
                                  child: Image.network(
                                image,
                                fit: BoxFit.cover,
                              )),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 14,
                                        color: AppColors.primaryColor),
                                  ),
                                  const SizedBox(width: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      profile,
                                      style: FontConstant.styleMedium(
                                          fontSize: 12, color: AppColors.black),
                                    ),
                                  ),
                                  StarRating(
                                    rating: rating,
                                    maxRating: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 2, bottom: 10),
                        child: DrawerCommanCode().buildText(feedback),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
