class ShortlistedListModel {
  String? status;
  ResponseData? responseData;

  ShortlistedListModel({this.status, this.responseData});

  ShortlistedListModel.fromJson(Map<String, dynamic> json) {
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
 dynamic shortId;
  dynamic matId;
  dynamic matName;
  dynamic logId;
  dynamic logMatId;
  dynamic createdAt;
  dynamic name;
  dynamic surename;
  dynamic age;
  dynamic caste;
  dynamic confirmEmail;
  dynamic profile;
  dynamic city;
  dynamic state;
  dynamic country;
  dynamic gender;
  dynamic photo1;
  dynamic height;
  dynamic maritalstatus;
  dynamic religion;
  dynamic regdate;
  dynamic dOB;
  dynamic occupation;
  dynamic chat_status;

  Data(
      {this.shortId,
      this.matId,
      this.matName,
      this.logId,
      this.logMatId,
      this.createdAt,
      this.name,
      this.surename,
      this.age,
      this.caste,
      this.confirmEmail,
      this.profile,
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
      this.chat_status});

  Data.fromJson(Map<String, dynamic> json) {
    shortId = json['short_id'];
    matId = json['mat_id'];
    matName = json['mat_name'];
    logId = json['log_id'];
    logMatId = json['log_mat_id'];
    createdAt = json['created_at'];
    name = json['Name'];
    surename = json['surename'];
    age = json['Age'];
    caste = json['Caste'];
    confirmEmail = json['ConfirmEmail'];
    profile = json['Profile'];
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
    chat_status = json['chat_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short_id'] = this.shortId;
    data['mat_id'] = this.matId;
    data['mat_name'] = this.matName;
    data['log_id'] = this.logId;
    data['log_mat_id'] = this.logMatId;
    data['created_at'] = this.createdAt;
    data['Name'] = this.name;
    data['surename'] = this.surename;
    data['Age'] = this.age;
    data['Caste'] = this.caste;
    data['ConfirmEmail'] = this.confirmEmail;
    data['Profile'] = this.profile;
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
    data['chat_status'] = this.chat_status;
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
