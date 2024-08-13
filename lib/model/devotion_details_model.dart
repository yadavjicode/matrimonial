class DevotionalDetailsModel {
  bool? status;
  Data? data;

  DevotionalDetailsModel({this.status, this.data});

  DevotionalDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic step7;
  dynamic somethingAboutYourDevotionalLife;
  dynamic iskonType;
  dynamic nameOfTemple;
  dynamic cityOfTheTemple;
  dynamic devotionalHobbies;

  Data(
      {this.step7,
      this.somethingAboutYourDevotionalLife,
      this.iskonType,
      this.nameOfTemple,
      this.cityOfTheTemple,
      this.devotionalHobbies});

  Data.fromJson(Map<String, dynamic> json) {
    step7 = json['step_7'];
    somethingAboutYourDevotionalLife =
        json['something_about_your_devotional_life'];
    iskonType = json['iskon_type'];
    nameOfTemple = json['name_of_temple'];
    cityOfTheTemple = json['city_of_the_temple'];
    devotionalHobbies = json['devotional_hobbies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_7'] = this.step7;
    data['something_about_your_devotional_life'] =
        this.somethingAboutYourDevotionalLife;
    data['iskon_type'] = this.iskonType;
    data['name_of_temple'] = this.nameOfTemple;
    data['city_of_the_temple'] = this.cityOfTheTemple;
    data['devotional_hobbies'] = this.devotionalHobbies;
    return data;
  }
}
