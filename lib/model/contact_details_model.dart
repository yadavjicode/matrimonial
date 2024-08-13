class ContactDetailsModel {
  bool? status;
  Data? data;

  ContactDetailsModel({this.status, this.data});

  ContactDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step3;
  dynamic mobile;
  dynamic confirmEmail;
  dynamic instagramId;

  Data({this.step3, this.mobile, this.confirmEmail, this.instagramId});

  Data.fromJson(Map<String, dynamic> json) {
    step3 = json['step_3'];
    mobile = json['Mobile'];
    confirmEmail = json['ConfirmEmail'];
    instagramId = json['instagram_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_3'] = this.step3;
    data['Mobile'] = this.mobile;
    data['ConfirmEmail'] = this.confirmEmail;
    data['instagram_id'] = this.instagramId;
    return data;
  }
}
