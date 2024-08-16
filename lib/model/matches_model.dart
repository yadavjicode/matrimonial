class MatchesModel {
  dynamic status;
  List<Data>? data;

  MatchesModel({this.status, this.data});

  MatchesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic hideIncome;
  dynamic lastlogin;
  dynamic createdAt;
  dynamic surename;
  dynamic nameTitle;
  dynamic matriID;
  dynamic occupation;
  dynamic confirmEmail;
  dynamic annualincome;
  dynamic profile;
  dynamic name;
  dynamic gender;
  dynamic pEFromAge;
  dynamic pEToAge;
  dynamic religion;
  dynamic caste;
  dynamic looking;
  dynamic dOB;
  dynamic height;
  dynamic state;
  dynamic country;
  dynamic education;
  dynamic profilecreatedby;
  dynamic age;
  dynamic photo1;

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
      this.photo1});

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
    photo1 = json['Photo1'];
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
    data['Photo1'] = this.photo1;
    return data;
  }
}
