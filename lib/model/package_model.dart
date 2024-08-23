class PackageModel {
  String? status;
  Data? data;

  PackageModel({this.status, this.data});

  PackageModel.fromJson(Map<String, dynamic> json) {
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
  Free? free;
  Premium? premium;

  Data({this.free, this.premium});

  Data.fromJson(Map<String, dynamic> json) {
    free = json['free'] != null ? new Free.fromJson(json['free']) : null;
    premium =
        json['premium'] != null ? new Premium.fromJson(json['premium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.free != null) {
      data['free'] = this.free!.toJson();
    }
    if (this.premium != null) {
      data['premium'] = this.premium!.toJson();
    }
    return data;
  }
}

class Free {
  int? id;
  String? planType;
  int? ableToSeePhotosOnOthersProfile;
  int? useFilterSortingFeature;
  int? viewFullProfileOfOthers;
  int? usingSearchFeature;
  int? chat;
  int? seeContactNumbers;
  int? sendInterest;
  Null? amount;
  Null? discountedAmount;
  int? durationInDays;
  Null? durationInMonth;

  Free(
      {this.id,
      this.planType,
      this.ableToSeePhotosOnOthersProfile,
      this.useFilterSortingFeature,
      this.viewFullProfileOfOthers,
      this.usingSearchFeature,
      this.chat,
      this.seeContactNumbers,
      this.sendInterest,
      this.amount,
      this.discountedAmount,
      this.durationInDays,
      this.durationInMonth});

  Free.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planType = json['plan_type'];
    ableToSeePhotosOnOthersProfile =
        json['able_to_see_photos_on_others_profile'];
    useFilterSortingFeature = json['use_filter_sorting_feature'];
    viewFullProfileOfOthers = json['view_full_profile_of_others'];
    usingSearchFeature = json['using_search_feature'];
    chat = json['chat'];
    seeContactNumbers = json['see_contact_numbers'];
    sendInterest = json['send_interest'];
    amount = json['amount'];
    discountedAmount = json['discounted_amount'];
    durationInDays = json['duration_in_days'];
    durationInMonth = json['duration_in_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_type'] = this.planType;
    data['able_to_see_photos_on_others_profile'] =
        this.ableToSeePhotosOnOthersProfile;
    data['use_filter_sorting_feature'] = this.useFilterSortingFeature;
    data['view_full_profile_of_others'] = this.viewFullProfileOfOthers;
    data['using_search_feature'] = this.usingSearchFeature;
    data['chat'] = this.chat;
    data['see_contact_numbers'] = this.seeContactNumbers;
    data['send_interest'] = this.sendInterest;
    data['amount'] = this.amount;
    data['discounted_amount'] = this.discountedAmount;
    data['duration_in_days'] = this.durationInDays;
    data['duration_in_month'] = this.durationInMonth;
    return data;
  }
}

class Premium {
  int? id;
  String? planType;
  int? ableToSeePhotosOnOthersProfile;
  int? useFilterSortingFeature;
  int? viewFullProfileOfOthers;
  int? usingSearchFeature;
  int? chat;
  int? seeContactNumbers;
  int? sendInterest;
  int? amount;
  String? discountedAmount;
  int? durationInDays;
  int? durationInMonth;

  Premium(
      {this.id,
      this.planType,
      this.ableToSeePhotosOnOthersProfile,
      this.useFilterSortingFeature,
      this.viewFullProfileOfOthers,
      this.usingSearchFeature,
      this.chat,
      this.seeContactNumbers,
      this.sendInterest,
      this.amount,
      this.discountedAmount,
      this.durationInDays,
      this.durationInMonth});

  Premium.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planType = json['plan_type'];
    ableToSeePhotosOnOthersProfile =
        json['able_to_see_photos_on_others_profile'];
    useFilterSortingFeature = json['use_filter_sorting_feature'];
    viewFullProfileOfOthers = json['view_full_profile_of_others'];
    usingSearchFeature = json['using_search_feature'];
    chat = json['chat'];
    seeContactNumbers = json['see_contact_numbers'];
    sendInterest = json['send_interest'];
    amount = json['amount'];
    discountedAmount = json['discounted_amount'];
    durationInDays = json['duration_in_days'];
    durationInMonth = json['duration_in_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_type'] = this.planType;
    data['able_to_see_photos_on_others_profile'] =
        this.ableToSeePhotosOnOthersProfile;
    data['use_filter_sorting_feature'] = this.useFilterSortingFeature;
    data['view_full_profile_of_others'] = this.viewFullProfileOfOthers;
    data['using_search_feature'] = this.usingSearchFeature;
    data['chat'] = this.chat;
    data['see_contact_numbers'] = this.seeContactNumbers;
    data['send_interest'] = this.sendInterest;
    data['amount'] = this.amount;
    data['discounted_amount'] = this.discountedAmount;
    data['duration_in_days'] = this.durationInDays;
    data['duration_in_month'] = this.durationInMonth;
    return data;
  }
}
