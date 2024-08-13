import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Profile Details',
          style: FontConstant.styleMedium(fontSize: 18, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
            onPressed: () {
              // Add filter functionality
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            BasicDetails(),

            SizedBox(
              height: 10,
            ),

            // Padding(
            //   padding: EdgeInsets.only(right: 18.0, left: 18),
            //   child: About(),
            // ),
            Compatiblity(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  ProfileHeaderState createState() => ProfileHeaderState();
}

class ProfileHeaderState extends State<ProfileHeader> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 390,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/girl1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Janvi Singla (ID:M1311901)',
                style: FontConstant.styleSemiBold(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Software Professional - Graduate',
                    style: FontConstant.styleSemiBold(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 120),
                  GestureDetector(
                    onTap: toggleFavorite,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Text(
                '26 Years | 5ft 5 inch',
                style: FontConstant.styleSemiBold(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class BasicDetails extends StatelessWidget {
  const BasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Profile created by myself',
                style: FontConstant.styleSemiBold(
                    fontSize: 12, color: Colors.black),
              ),
              const SizedBox(width: 2),
              Text(
                '|',
                style: FontConstant.styleSemiBold(
                    fontSize: 12, color: Colors.black),
              ),
              const SizedBox(width: 2),
              Text(
                'Last Login: 3 minutes ago',
                style: FontConstant.styleSemiBold(
                    fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            'Basic Details:',
            style: FontConstant.styleSemiBold(
              fontSize: 18,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          const BasicDetailsGrid(),
        ],
      ),
    );
  }
}

class BasicDetailsGrid extends StatelessWidget {
  const BasicDetailsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        DetailRow(
          icon: Icons.male,
          title: 'Gender',
          value: 'Female',
        ),
        DetailRow(
          icon: Icons.cake,
          title: 'Birth Date',
          value: '19 Oct, 1985',
        ),
        DetailRow(
          icon: Icons.favorite_border,
          title: 'Religion',
          value: 'Hindu',
        ),
        DetailRow(
          icon: Icons.favorite,
          title: 'Marital Status',
          value: 'Never Married',
        ),
        DetailRow(
          icon: Icons.school,
          title: 'Study',
          value: 'Master degree in MSc',
        ),
        DetailRow(
          icon: Icons.language,
          title: 'Language',
          value: 'English, Hindi, Punjabi, French',
        ),
        DetailRow(
          icon: Icons.location_on,
          title: 'Lived In',
          value: 'Delhi/NCR',
        ),
        DetailRow(
          icon: Icons.work,
          title: 'Occupation',
          value: 'Finance Professional',
        ),
      ],
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailRow({
    required this.icon,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      child: Row(
        children: [
          Icon(icon, color: Colors.pink),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontConstant.styleRegular(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: FontConstant.styleRegular(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          // tabAlignment: TabAlignment.start,
          controller: tabController,
          isScrollable: true,
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.primaryColor,
          tabs: const [
            Tab(text: 'About Janvi'),
            Tab(text: 'Lifestyle & Appearances'),
            Tab(text: 'Background'),
            Tab(text: 'Contact Details'),
            Tab(text: 'Professional Details'),
          ],
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: tabController,
            children: const [
              Center(child: Text('About Janvi Content')),
              Center(child: Text('Lifestyle & Appearances Content')),
              Center(child: Text('Background Content')),
              Center(child: Text('Contact Details Content')),
              Center(child: Text('Professional Details Content')),
            ],
          ),
        ),
      ],
    );
  }
}

class Compatiblity extends StatefulWidget {
  const Compatiblity({super.key});

  @override
  State<Compatiblity> createState() => _CompatiblityState();
}

class _CompatiblityState extends State<Compatiblity> {
  Widget buildAvatarColumn(String imagePath, String label) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: FontConstant.styleMedium(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding:
          const EdgeInsets.only(left: 18.0, right: 18, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Compatibility Rate:',
            style: FontConstant.styleMedium(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              buildAvatarColumn('assets/images/girl1.png', 'Her \nPreferences'),
              const Padding(
                  padding: EdgeInsets.only(bottom: 45.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xff583789),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: Text(
                  'You match 5/8 of \nher preferences',
                  textAlign: TextAlign.center,
                  style: FontConstant.styleMedium(
                      fontSize: 14, color: const Color(0xff583789)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0xff583789),
                ),
              ),
              const Spacer(),
              buildAvatarColumn('assets/images/avatar.jpg', 'Your \nMatch'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const InfoRow('Age', '20 to 30', false),
                const InfoRow('Height', "5' 4\" to 6' 3\"", true),
                const InfoRow('Marital Status', 'Never Married', false),
                const InfoRow('Religion / Community', 'Hindu', true),
                const InfoRow('Country Living in', 'India', true),
                const InfoRow('State Living in', 'New Delhi', true),
                const InfoRow('Annual Income', 'INR 2 lakhs to 15 lakhs', true),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        child: const Text('CALL NOW'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff583789),
                        ),
                        child: const Text('CHAT NOW'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isValid;

  const InfoRow(this.title, this.value, this.isValid, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontConstant.styleMedium(
                      fontSize: 15, color: Colors.black),
                ),
                Text(
                  value,
                  style: FontConstant.styleMedium(
                      fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Icon(
            isValid ? Icons.check_circle : Icons.cancel,
            color: isValid ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}
