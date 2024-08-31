class DashboardModel {
  String? status;
  ResponseData? responseData;

  DashboardModel({this.status, this.responseData});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new ResponseData.fromJson(json['response_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.responseData != null) {
      data['response_data'] = this.responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  List<DailyRecommendation>? dailyRecommendation;
  List<DailyRecommendation>? matches;
  List<DailyRecommendation>? intrestedInYou;
  int? receivedInvitation;
  List<DailyRecommendation>? recentlyJoined;
   int? matchesNearByCount;
  int? matchesEducationCount;
  int? matchesProfessionalCount;

  ResponseData(
      {this.dailyRecommendation,
      this.matches,
      this.intrestedInYou,
      this.receivedInvitation,
      this.recentlyJoined,
      this.matchesNearByCount,
      this.matchesEducationCount,
      this.matchesProfessionalCount});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['daily_recommendation'] != null) {
      dailyRecommendation = <DailyRecommendation>[];
      json['daily_recommendation'].forEach((v) {
        dailyRecommendation!.add(new DailyRecommendation.fromJson(v));
      });
    }
    if (json['matches'] != null) {
      matches = <DailyRecommendation>[];
      json['matches'].forEach((v) {
        matches!.add(new DailyRecommendation.fromJson(v));
      });
    }
    if (json['intrested_in_you'] != null) {
      intrestedInYou = <DailyRecommendation>[];
      json['intrested_in_you'].forEach((v) {
        intrestedInYou!.add(new DailyRecommendation.fromJson(v));
      });
    }
    receivedInvitation = json['received_invitation'];
    if (json['recently_joined'] != null) {
      recentlyJoined = <DailyRecommendation>[];
      json['recently_joined'].forEach((v) {
        recentlyJoined!.add(new DailyRecommendation.fromJson(v));
      });
    }
    matchesNearByCount = json['matches_near_by_count'];
    matchesEducationCount = json['matches_education_count'];
    matchesProfessionalCount = json['matches_professional_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dailyRecommendation != null) {
      data['daily_recommendation'] =
          this.dailyRecommendation!.map((v) => v.toJson()).toList();
    }
    if (this.matches != null) {
      data['matches'] = this.matches!.map((v) => v.toJson()).toList();
    }
    if (this.intrestedInYou != null) {
      data['intrested_in_you'] =
          this.intrestedInYou!.map((v) => v.toJson()).toList();
    }
    data['received_invitation'] = this.receivedInvitation;
    if (this.recentlyJoined != null) {
      data['recently_joined'] =
          this.recentlyJoined!.map((v) => v.toJson()).toList();
    }
    data['matches_near_by_count'] = this.matchesNearByCount;
    data['matches_education_count'] = this.matchesEducationCount;
    data['matches_professional_count'] = this.matchesProfessionalCount;
    return data;
  }
}

class DailyRecommendation {
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
  String? Photo1;
  String? Age;
   dynamic shortlistStatus;
  dynamic interestStatus;
  dynamic accountType;
  dynamic chatStatus;

  DailyRecommendation(
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
      this.Photo1,
      this.Age,
      this.shortlistStatus,
      this.interestStatus,
      this.accountType,
      this.chatStatus
      });

  DailyRecommendation.fromJson(Map<String, dynamic> json) {
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
    Photo1 = json['Photo1'];
    Age = json['Age'];
    shortlistStatus = json['shortlist_status'];
    interestStatus = json['interest_status'];
    accountType = json['account_type'];
    chatStatus = json['chat_status'];
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
    data['Photo1'] = this.Photo1;
    data['Age'] = this.Age;
    data['shortlist_status'] = this.shortlistStatus;
    data['interest_status'] = this.interestStatus;
    data['account_type'] = this.accountType;
    data['chat_status'] = this.chatStatus;
    return data;
  }
}
