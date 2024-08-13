class ProfileAModel {
  bool? status;
  Data? data;

  ProfileAModel({this.status, this.data});

  ProfileAModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step1;
  dynamic profileFor;
  dynamic gender;

  Data({this.step1, this.profileFor, this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    step1 = json['step_1'];
    profileFor = json['profile_for'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_1'] = this.step1;
    data['profile_for'] = this.profileFor;
    data['Gender'] = this.gender;
    return data;
  }
}
