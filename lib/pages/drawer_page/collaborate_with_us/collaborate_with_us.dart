import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class CollaborateWithUs extends StatefulWidget {
  const CollaborateWithUs({super.key});

  @override
  State<CollaborateWithUs> createState() => _CollaborateWithUsState();
}

class _CollaborateWithUsState extends State<CollaborateWithUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Collaborate With Us",
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
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset("assets/images/Collaborate.png",
                      fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      DrawerCommanCode().buildTextBold("Hare Krishna!\n"),
                      DrawerCommanCode().buildText(
                          "If you liked our work and you also want to become a part of this glorious seva then you can give us your details, our team will contact you.\n"),
                      CustomTextField(
                        labelText: "Your Name",
                        borderRadius: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: "Phone No.",
                              borderRadius: 5,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextField(
                              labelText: "Email ID",
                              borderRadius: 5,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: "City",
                              borderRadius: 5,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextField(
                              labelText: "State",
                              borderRadius: 5,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: CustomDrawerButton(
                            color: AppColors.primaryColor,
                            text: "SUBMIT",
                            onPressed: () => {},
                            textStyle: FontConstant.styleRegular(
                                fontSize: 14, color: AppColors.constColor),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
