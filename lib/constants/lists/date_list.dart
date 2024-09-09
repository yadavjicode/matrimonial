import 'package:get/get.dart';

class DayController extends GetxController {
  var selectedItem = RxnString();

  static List<String> DayList() {
    List<String> day = [];
    for (int i = 1; i <= 31; i++) {
      if (i.toString().length == 1) {
        day.add("0${i}");
      } else {
        day.add("${i}");
      }
    }
    return day;
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}

class MonthController extends GetxController {
  var selectedItem = RxnString();

  static List<String> MonthList() {
    List<String> month = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    // for (int i = 1; i <= 12; i++) {
    //   month.add("$i");
    // }
    return month;
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}

class YearController extends GetxController {
  var selectedYear = RxnString();

  static List<String> yearList() {
    int currentYear = DateTime.now().year;
    List<String> years = [];
    for (int i = currentYear - 17; i >= currentYear - 54; i--) {
      years.add(i.toString());
    }
    return years;
  }

  void selectYear(String? value) {
    selectedYear.value = value;
  }
}
