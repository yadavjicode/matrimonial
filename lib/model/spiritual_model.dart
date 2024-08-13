class SpiritualDetailsModel {
  bool? status;
  Data? data;

  SpiritualDetailsModel({this.status, this.data});

  SpiritualDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step8;
  dynamic nameOfTheCounselorOfMySpiritualPath;
  dynamic connectedWithMyCounselerSince;
  dynamic withWhichTempleYourCounselorIsConnectedTo;
  dynamic counselorResidingInState;
  dynamic counselorResidingInCity;
  dynamic somethingAboutMoreCounselor;

  Data(
      {this.step8,
      this.nameOfTheCounselorOfMySpiritualPath,
      this.connectedWithMyCounselerSince,
      this.withWhichTempleYourCounselorIsConnectedTo,
      this.counselorResidingInState,
      this.counselorResidingInCity,
      this.somethingAboutMoreCounselor});

  Data.fromJson(Map<String, dynamic> json) {
    step8 = json['step_8'];
    nameOfTheCounselorOfMySpiritualPath =
        json['name_of_the_counselor_of_my_spiritual_path'];
    connectedWithMyCounselerSince = json['connected_with_my_counseler_since'];
    withWhichTempleYourCounselorIsConnectedTo =
        json['with_which_temple_your_counselor_is_connected_to'];
    counselorResidingInState = json['counselor_residing_in_state'];
    counselorResidingInCity = json['counselor_residing_in_city'];
    somethingAboutMoreCounselor = json['something_about_more_counselor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_8'] = this.step8;
    data['name_of_the_counselor_of_my_spiritual_path'] =
        this.nameOfTheCounselorOfMySpiritualPath;
    data['connected_with_my_counseler_since'] =
        this.connectedWithMyCounselerSince;
    data['with_which_temple_your_counselor_is_connected_to'] =
        this.withWhichTempleYourCounselorIsConnectedTo;
    data['counselor_residing_in_state'] = this.counselorResidingInState;
    data['counselor_residing_in_city'] = this.counselorResidingInCity;
    data['something_about_more_counselor'] = this.somethingAboutMoreCounselor;
    return data;
  }
}
