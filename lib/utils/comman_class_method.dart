import 'package:intl/intl.dart';

class CommanClass {
  static String commaString(List<String?> list) {
    List<String> data = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null && list[i]!.isNotEmpty) {
        data.add(list[i]!);
      }
    }
    return data.join(", ");
  }

  static String hyphenString(List<String?> list) {
    List<String> data = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null && list[i]!.isNotEmpty) {
        data.add(list[i]!);
      }
    }
    return data.join(" - ");
  }

  static String dateFormat(String? date) {
    if (date != null) {
      return DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
    } else {
      return "";
    }
  }

  static String photo(String? photo, String? gender) {
    if (photo != null) {
      return "http://devoteematrimony.aks.5g.in/$photo";
    } else {
      if (gender != null) {
        if (gender == "Male") {
          return "https://devoteematrimony.aks.5g.in/public/images/nophoto.png";
        } else {
          return "https://devoteematrimony.aks.5g.in/public/images/nophotof.jpg";
        }
      } else {
        return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvmLjYj0ADoq3XB2XLYWsv6_M-IzKhsbam4g&s";
      }
    }
  }


 static String hisHer(String? gender) {
    if (gender != null) {
      if(gender=="Male"){
        return "his";
      }else if(gender=="Female"){
        return "her";
      }else{
        return "their";
      }
    }else {
      return "their";
    }
  }
}
