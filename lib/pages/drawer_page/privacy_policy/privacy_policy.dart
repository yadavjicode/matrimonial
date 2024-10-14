import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
//                   Html(
//                     data:
//                         """
//             <p><strong>Privacy Policy for &ldquo;Devotee Matrimony&rdquo;</strong></p>
//             <p>&nbsp;</p>
//                   <p><strong>Effective Date:</strong> November 1st 2024 to till date</p>
//             <p>&nbsp;</p>
//             <ol>
//             <li><strong> Introduction</strong></li>
//              </ol>
//              <p>Welcome to Devotee Matrimony. We are committed to protecting your privacy and ensuring your personal information is handled responsibly. This Privacy Policy explains how we collect, use, and protect your information when you use our website/ application.</p>
//              <p>&nbsp;</p>
//              <ol start="2">
//              <li><strong> Information We Collect</strong></li>
// </ol>
// <p>We collect various types of information, including:</p>
// <p>&nbsp;</p>
// <ul>
// <li><strong>Personal Information:</strong> This may include your name, email address, phone number, date of birth, gender, and other information you provide when creating an account.</li>
// </ul>
// <p>&nbsp;</p>
// <ul>
// <li><strong>Profile Information:</strong> Information that you provide for your matrimonial profile, including preferences, interests, and photographs.</li>
// </ul>
// <p>&nbsp;</p>
// <ul>
// <li><strong>Usage Data:</strong> Information about how you use our website/ application, including your IP address, browser type, access times, and pages viewed.</li>
// </ul>
// <p>&nbsp;</p>
// <ol start="3">
// <li><strong> How We Use Your Information</strong></li>
// </ol>
// <p>We use your information for the following purposes:</p>
// <ul>
// <li>To create and manage your account.</li>
// <li>To provide customer support and respond to your inquiries.</li>
// <li>To personalize your experience on our website/ application.</li>
// <li>To match you with potential partners based on your profile information and preferences.</li>
// <li>To send you updates, newsletters, and promotional materials.</li>
// <li>To improve our website/ application and services based on user feedback and usage data.</li>
// </ul>
// <p>&nbsp;</p>
// <ol start="4">
// <li><strong> Sharing Your Information</strong></li>
// </ol>
// <p>We do not sell or rent your personal information to third parties. We may share your information in the following circumstances:</p>
// <p>&nbsp;</p>
// <ul>
// <li><strong>With Service Providers:</strong> We may employ third-party companies and individuals to facilitate our service, such as hosting providers, analytics services, and payment processors. These third parties have access to your personal information only to perform specific tasks on our behalf and are obligated not to disclose it.</li>
// </ul>
// <p>&nbsp;</p>
// <ul>
// <li><strong>Legal Requirements:</strong> We may disclose your information if required to do so by law or in response to valid requests by public authorities.</li>
// </ul>
// <p>&nbsp;</p>
// <p>&nbsp;</p>
// <ol start="5">
// <li><strong> Security of Your Information</strong></li>
// </ol>
// <p>We take the security of your personal information seriously. We implement various security measures to protect your information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.</p>
// <p>&nbsp;</p>
// <ol start="6">
// <li><strong> Changes to This Privacy Policy</strong></li>
// </ol>
// <p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Your continued use of the website/ application after changes constitute your acceptance of the new Privacy Policy.</p>
//                    <p>&nbsp;</p>
//                        <ol start="7">
//                   <li><strong> Contact Us</strong></li>
//                    </ol>
//                      <p>If you have any questions about this Privacy Policy, please contact us at: support@devoteematrimony.in</p>
//                   """,
//                   ),

                  Image.asset(
                    "assets/images/ppA.png",
                  ),
                  Image.asset(
                    "assets/images/ppB.png",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
