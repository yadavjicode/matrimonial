class SearchsModel {
  String? status;
  ResponseData? responseData;
  int? profileCount;

  SearchsModel({this.status, this.responseData, this.profileCount});

  SearchsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseData = json['response_data'] != null
        ? new ResponseData.fromJson(json['response_data'])
        : null;
    profileCount = json['profileCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.responseData != null) {
      data['response_data'] = this.responseData!.toJson();
    }
    data['profileCount'] = this.profileCount;
    return data;
  }
}

class ResponseData {
  dynamic currentPage;
  List<Data>? data;
  dynamic firstPageUrl;
  dynamic from;
  dynamic lastPage;
  dynamic lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  ResponseData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ResponseData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
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
  dynamic shortlistStatus;
  dynamic interestStatus;
  dynamic accountType;
  dynamic chat_status;
  dynamic hideLastActiveStatus;
  dynamic hideOnlineStatus;
  dynamic hideProfileStatus;
  dynamic hidePhoneStatus;
  dynamic hideEmailStatus;
  dynamic hideAstroStatus;

  Data({
    this.hideIncome,
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
    this.photo1,
    this.shortlistStatus,
    this.interestStatus,
    this.accountType,
    this.chat_status,
    this.hideLastActiveStatus,
    this.hideOnlineStatus,
    this.hidePhoneStatus,
    this.hideEmailStatus,
    this.hideProfileStatus,
    this.hideAstroStatus,
  });

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
    shortlistStatus = json['shortlist_status'];
    interestStatus = json['interest_status'];
    accountType = json['account_type'];
    chat_status = json['chat_status'];
    hideLastActiveStatus = json['hide_last_active'];
    hideOnlineStatus = json['hide_online_status'];
    hidePhoneStatus = json['hide_phone_status'];
    hideEmailStatus = json['hide_email_status'];
    hideProfileStatus = json['hide_profile_temp'];
    hideAstroStatus = json['hide_astrological_info'];
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
    data['shortlist_status'] = this.shortlistStatus;
    data['interest_status'] = this.interestStatus;
    data['account_type'] = this.accountType;
    data['chat_status'] = this.chat_status;
    data['hide_last_active'] = this.hideLastActiveStatus;
    data['hide_online_status'] = this.hideOnlineStatus;
    data['hide_phone_status'] = this.hidePhoneStatus;
    data['hide_email_status'] = this.hideEmailStatus;
    data['hide_profile_temp'] = this.hideProfileStatus;
    data['hide_astrological_info'] = this.hideAstroStatus;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
