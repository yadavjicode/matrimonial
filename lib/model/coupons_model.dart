class CouponModel {
  String? status;
  List<Data>? data;

  CouponModel({this.status, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
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
  dynamic id;
  dynamic couponName;
  dynamic discountType;
  dynamic fromDate;
  dynamic toDate;
  dynamic discount;
  dynamic noOfUser;
  dynamic gender;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

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
