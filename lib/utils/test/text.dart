import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/profile_details_controller.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final PageController _pageController =
      PageController(initialPage: 1000); // Start in the middle
  final List<Widget> pages = [Page1(), Page2(), Page3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Looping PageView')),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // Calculate which page to show using modulus operation
          int pageIndex = index % pages.length;
          return pages[pageIndex];
        },
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Page 1 ${profileDetailsController.member?.data?.name}',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Page 1 ${profileDetailsController.member?.data?.name}',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Page 3',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
