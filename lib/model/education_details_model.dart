class EducationDetailsModel {
  bool? status;
  Data? data;

  EducationDetailsModel({this.status, this.data});

  EducationDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic education;
  dynamic professionalQualification;
  dynamic step5;
  dynamic profile;

  Data(
      {this.step5,
      this.education,
      this.professionalQualification,
      this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    step5 = json['step_5'];
    education = json['Education'];
    professionalQualification = json['professional_qualification'];
    profile = json['Profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_5'] = this.step5;
    data['Education'] = this.education;
    data['professional_qualification'] = this.professionalQualification;
    data['Profile'] = this.profile;
    return data;
  }
}
