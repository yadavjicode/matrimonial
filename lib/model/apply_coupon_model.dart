class ApplyCouponModel {
  String? message;
  Data? data;
  String? status;

  ApplyCouponModel({this.message, this.data, this.status});

  ApplyCouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? couponName;
  String? discountType;
  String? fromDate;
  String? toDate;
  int? discount;
  int? noOfUser;
  String? gender;
  int? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.couponName,
      this.discountType,
      this.fromDate,
      this.toDate,
      this.discount,
      this.noOfUser,
      this.gender,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponName = json['coupon_name'];
    discountType = json['discount_type'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    discount = json['discount'];
    noOfUser = json['no_of_user'];
    gender = json['gender'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coupon_name'] = this.couponName;
    data['discount_type'] = this.discountType;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['discount'] = this.discount;
    data['no_of_user'] = this.noOfUser;
    data['gender'] = this.gender;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
