import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OurWebsite extends StatefulWidget {
  const OurWebsite({super.key});

  @override
  State<OurWebsite> createState() => _OurWebsiteState();
}

class _OurWebsiteState extends State<OurWebsite> {
  final String websiteUrl = 'https://www.devoteematrimony.in';

  Future<void> _launchURL() async {
    if (await canLaunch(websiteUrl)) {
      await launch(websiteUrl);
    } else {
      throw 'Could not launch $websiteUrl';
    }
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
          "Our Website",
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildTextBold("Hare Krishna!\n"),
                    DrawerCommanCode()
                        .buildText("You can also use our offcial website"),
                    GestureDetector(
                        onTap: _launchURL,
                        child: const Text("www.devoteematrimony.in\n",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.darkblue,
                                fontSize: 14))),
                    DrawerCommanCode().buildText(
                        "You will find same features and same profiles on that website, but yes as of now, chat feature is not there at the website. By mercy of the Lordship, that feature will also be there very soon.")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
