import 'package:get/get.dart';

class TittleController extends GetxController {
  var selectedItem = RxnString();

  static List<String> TittleList() {
    List<String> tittle = [
      "Mr.",
      "Mrs.",
      "Ms.",
    ];
    return tittle;
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}
