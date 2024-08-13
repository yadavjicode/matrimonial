class SearchsModel {
  String? status;
  List<Data>? data;
  int? profileCount;

  SearchsModel({this.status, this.data, this.profileCount});

  SearchsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    profileCount = json['profileCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['profileCount'] = this.profileCount;
    return data;
  }
}

class Data {
  int? hideIncome;
  String? lastlogin;
  String? createdAt;
  String? surename;
  String? nameTitle;
  String? matriID;
  String? occupation;
  String? confirmEmail;
  String? annualincome;
  String? profile;
  String? name;
  String? gender;
  String? pEFromAge;
  String? pEToAge;
  String? religion;
  String? caste;
  String? looking;
  String? dOB;
  String? height;
  String? state;
  String? country;
  String? education;
  String? profilecreatedby;
  String? age;
  String? profileImages;

  Data(
      {this.hideIncome,
      this.lastlogin,
      this.createdAt,
      this.surename,
      this.nameTitle,
      this.matriID,
      this.occupation,
      this.confirmEmail,
      this.annualincome,
      this.profile,
      this.name,
      this.gender,
      this.pEFromAge,
      this.pEToAge,
      this.religion,
      this.caste,
      this.looking,
      this.dOB,
      this.height,
      this.state,
      this.country,
      this.education,
      this.profilecreatedby,
      this.age,
      this.profileImages});

  Data.fromJson(Map<String, dynamic> json) {
    hideIncome = json['hide_income'];
    lastlogin = json['Lastlogin'];
    createdAt = json['created_at'];
    surename = json['surename'];
    nameTitle = json['name_title'];
    matriID = json['MatriID'];
    occupation = json['Occupation'];
    confirmEmail = json['ConfirmEmail'];
    annualincome = json['Annualincome'];
    profile = json['Profile'];
    name = json['Name'];
    gender = json['Gender'];
    pEFromAge = json['PE_FromAge'];
    pEToAge = json['PE_ToAge'];
    religion = json['Religion'];
    caste = json['Caste'];
    looking = json['Looking'];
    dOB = json['DOB'];
    height = json['Height'];
    state = json['State'];
    country = json['Country'];
    education = json['Education'];
    profilecreatedby = json['Profilecreatedby'];
    age = json['Age'];
    profileImages = json['ProfileImages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hide_income'] = this.hideIncome;
    data['Lastlogin'] = this.lastlogin;
    data['created_at'] = this.createdAt;
    data['surename'] = this.surename;
    data['name_title'] = this.nameTitle;
    data['MatriID'] = this.matriID;
    data['Occupation'] = this.occupation;
    data['ConfirmEmail'] = this.confirmEmail;
    data['Annualincome'] = this.annualincome;
    data['Profile'] = this.profile;
    data['Name'] = this.name;
    data['Gender'] = this.gender;
    data['PE_FromAge'] = this.pEFromAge;
    data['PE_ToAge'] = this.pEToAge;
    data['Religion'] = this.religion;
    data['Caste'] = this.caste;
    data['Looking'] = this.looking;
    data['DOB'] = this.dOB;
    data['Height'] = this.height;
    data['State'] = this.state;
    data['Country'] = this.country;
    data['Education'] = this.education;
    data['Profilecreatedby'] = this.profilecreatedby;
    data['Age'] = this.age;
    data['ProfileImages'] = this.profileImages;
    return data;
  }
}
