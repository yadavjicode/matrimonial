class HtmlContentModel {
  String? status;
  Data? data;

  HtmlContentModel({this.status, this.data});

  HtmlContentModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? wisdom;
  String? suggestion;
  String? disclaimer;
  String? dowrySection;
  String? privacyPolicy;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.wisdom,
      this.suggestion,
      this.disclaimer,
      this.dowrySection,
      this.createdAt,
      this.updatedAt,
      this.privacyPolicy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wisdom = json['wisdom'];
    suggestion = json['suggestion'];
    disclaimer = json['disclaimer'];
    dowrySection = json['dowry_section'];
    privacyPolicy = json['privacy_policy'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wisdom'] = this.wisdom;
    data['suggestion'] = this.suggestion;
    data['disclaimer'] = this.disclaimer;
    data['dowry_section'] = this.dowrySection;
    data['privacy_policy'] = this.privacyPolicy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
