class AboutGroomBrideModel {
  bool? status;
  Data? data;

  AboutGroomBrideModel({this.status, this.data});

  AboutGroomBrideModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step10;
  dynamic hobbies;
  dynamic groomBride;

  Data({this.step10, this.hobbies, this.groomBride});

  Data.fromJson(Map<String, dynamic> json) {
    step10 = json['step_10'];
    hobbies = json['Hobbies'];
    groomBride = json['groom_bride'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_10'] = this.step10;
    data['Hobbies'] = this.hobbies;
    data['groom_bride'] = this.groomBride;
    return data;
  }
}
