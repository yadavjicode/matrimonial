import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../constants/CustomTextFeild.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../controller/add_testimonial_controller.dart';

class AddTestimonial extends StatefulWidget {
  const AddTestimonial({super.key});

  @override
  State<AddTestimonial> createState() => _AddTestimonialState();
}

class _AddTestimonialState extends State<AddTestimonial> {
  final TextEditingController testimonial = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddTestimonialController addTestimonialController =
      Get.put(AddTestimonialController());
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Add Testimonials",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
        ),
        body: Obx(() {
          return Stack(
            children: [
              Container(
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/images/bg3.png")),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset("assets/images/testimonial.png",
                            fit: BoxFit.cover),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add Star Rating",
                                style: FontConstant.styleRegular(
                                    fontSize: 14, color: AppColors.black),
                              ),
                              RatingBar.builder(
                                itemPadding: EdgeInsets.all(7),
                                itemSize: 40,
                                initialRating: rating,
                                minRating: 0,
                                maxRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: AppColors.yellow,
                                ),
                                onRatingUpdate: (newRating) {
                                  setState(() {
                                    rating = newRating;
                                  });
                                  print("New Rating: $newRating");
                                },
                              ),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: CustomTextField(
                          controller: testimonial,
                          maxline: 7,
                          borderRadius: 5,
                          hintText: "Please enter Something",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Something';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: CustomDrawerButton(
                            color: AppColors.primaryColor,
                            text: "Submit",
                            onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {
                                  addTestimonialController.addTestimonial(
                                      context,
                                      rating,
                                      testimonial.text.toString().trim())
                                },
                            },
                            textStyle: FontConstant.styleRegular(
                                fontSize: 14, color: AppColors.constColor),
                          ))
                    ],
                  ),
                ),
              ),
              if (addTestimonialController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        }));
  }
}
