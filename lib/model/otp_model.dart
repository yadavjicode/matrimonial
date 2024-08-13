class OtpModel {
  bool? status;
  Datas? datas;

  OtpModel({this.status, this.datas});

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    datas = json['data'] != null ? new Datas.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.datas != null) {
      data['data'] = this.datas!.toJson();
    }
    return data;
  }
}

class Datas {
  bool? status;
  Data? data;

  Datas({this.status, this.data});

  Datas.fromJson(Map<String, dynamic> json) {
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
  String? token;
  String? message;
  Member? member;

  Data({this.token, this.message, this.member});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
    member =
        json['member'] != null ? new Member.fromJson(json['member']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['message'] = this.message;
    if (this.member != null) {
      data['member'] = this.member!.toJson();
    }
    return data;
  }
}

class Member {
  String? matriID;
  String? name;
  String? surename;
  String? confirmEmail;
  String? profileImage;

  Member(
      {this.matriID,
      this.name,
      this.surename,
      this.confirmEmail,
      this.profileImage});

  Member.fromJson(Map<String, dynamic> json) {
    matriID = json['MatriID'];
    name = json['Name'];
    surename = json['surename'];
    confirmEmail = json['ConfirmEmail'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MatriID'] = this.matriID;
    data['Name'] = this.name;
    data['surename'] = this.surename;
    data['ConfirmEmail'] = this.confirmEmail;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
