import 'package:get/get.dart';

class AgeController extends GetxController {
  var selectedItem = RxnString();

  static List<String> AgeTypes() {
    List<String> ages = [];
    for (int age = 18; age <= 50; age++) {
      ages.add('$age Yrs');
    }
    return ages;
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}
