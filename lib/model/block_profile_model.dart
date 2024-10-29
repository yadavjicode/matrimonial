class BlockProfileModel {
  String? status;
  List<ResponseData>? responseData;

  BlockProfileModel({this.status, this.responseData});

  BlockProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response_data'] != null) {
      responseData = <ResponseData>[];
      json['response_data'].forEach((v) {
        responseData!.add(new ResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.responseData != null) {
      data['response_data'] =
          this.responseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseData {
  int? id;
  String? blockerId;
  String? blockedId;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? surename;
  String? age;
  String? caste;
  String? confirmEmail;
  String? about;
  String? city;
  String? state;
  String? country;
  String? gender;
  String? photo1;
  String? height;
  String? maritalstatus;
  String? religion;
  String? regdate;
  String? dOB;
  String? occupation;
  String? education;
  int? hideLastActive;
  int? hideOnlineStatus;
  int? hideProfileTemp;
  int? hidePhoneStatus;
  int? hideEmailStatus;
  int? hideAstrologicalInfo;

  ResponseData(
      {this.id,
      this.blockerId,
      this.blockedId,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.surename,
      this.age,
      this.caste,
      this.confirmEmail,
      this.about,
      this.city,
      this.state,
      this.country,
      this.gender,
      this.photo1,
      this.height,
      this.maritalstatus,
      this.religion,
      this.regdate,
      this.dOB,
      this.occupation,
      this.education,
      this.hideLastActive,
      this.hideOnlineStatus,
      this.hideProfileTemp,
      this.hidePhoneStatus,
      this.hideEmailStatus,
      this.hideAstrologicalInfo});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    blockerId = json['blocker_id'];
    blockedId = json['blocked_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['Name'];
    surename = json['surename'];
    age = json['Age'];
    caste = json['Caste'];
    confirmEmail = json['ConfirmEmail'];
    about = json['about'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
    gender = json['Gender'];
    photo1 = json['Photo1'];
    height = json['Height'];
    maritalstatus = json['Maritalstatus'];
    religion = json['Religion'];
    regdate = json['Regdate'];
    dOB = json['DOB'];
    occupation = json['Occupation'];
    education = json['Education'];
    hideLastActive = json['hide_last_active'];
    hideOnlineStatus = json['hide_online_status'];
    hideProfileTemp = json['hide_profile_temp'];
    hidePhoneStatus = json['hide_phone_status'];
    hideEmailStatus = json['hide_email_status'];
    hideAstrologicalInfo = json['hide_astrological_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['blocker_id'] = this.blockerId;
    data['blocked_id'] = this.blockedId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['Name'] = this.name;
    data['surename'] = this.surename;
    data['Age'] = this.age;
    data['Caste'] = this.caste;
    data['ConfirmEmail'] = this.confirmEmail;
    data['about'] = this.about;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Gender'] = this.gender;
    data['Photo1'] = this.photo1;
    data['Height'] = this.height;
    data['Maritalstatus'] = this.maritalstatus;
    data['Religion'] = this.religion;
    data['Regdate'] = this.regdate;
    data['DOB'] = this.dOB;
    data['Occupation'] = this.occupation;
    data['Education'] = this.education;
    data['hide_last_active'] = this.hideLastActive;
    data['hide_online_status'] = this.hideOnlineStatus;
    data['hide_profile_temp'] = this.hideProfileTemp;
    data['hide_phone_status'] = this.hidePhoneStatus;
    data['hide_email_status'] = this.hideEmailStatus;
    data['hide_astrological_info'] = this.hideAstrologicalInfo;
    return data;
  }
}
