class LocationDetailsModel {
  bool? status;
  Data? data;

  LocationDetailsModel({this.status, this.data});

  LocationDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step4;
  dynamic country;
  dynamic addressType;
  dynamic permanentHouseType;
  dynamic permanentState;
  dynamic permanentCity;
  dynamic permanentPincode;
  dynamic tempState;
  dynamic tempCity;
  dynamic tempPincode;
  dynamic reference1Reletion;
  dynamic reference1Name;
  dynamic reference1Email;
  dynamic reference1Mobile;
  dynamic reference2Reletion;
  dynamic reference2Name;
  dynamic reference2Email;
  dynamic reference2Mobile;

  Data(
      {this.step4,
      this.country,
      this.addressType,
      this.permanentHouseType,
      this.permanentState,
      this.permanentCity,
      this.permanentPincode,
      this.tempState,
      this.tempCity,
      this.tempPincode,
      this.reference1Reletion,
      this.reference1Name,
      this.reference1Email,
      this.reference1Mobile,
      this.reference2Reletion,
      this.reference2Name,
      this.reference2Email,
      this.reference2Mobile});

  Data.fromJson(Map<String, dynamic> json) {
    step4 = json['step_4'];
    country = json['Country'];
    addressType = json['address_type'];
    permanentHouseType = json['permanent_house_type'];
    permanentState = json['permanent_state'];
    permanentCity = json['permanent_city'];
    permanentPincode = json['permanent_pincode'];
    tempState = json['temp_state'];
    tempCity = json['temp_city'];
    tempPincode = json['temp_pincode'];
    reference1Reletion = json['reference1_reletion'];
    reference1Name = json['reference1_name'];
    reference1Email = json['reference1_email'];
    reference1Mobile = json['reference1_mobile'];
    reference2Reletion = json['reference2_reletion'];
    reference2Name = json['reference2_name'];
    reference2Email = json['reference2_email'];
    reference2Mobile = json['reference2_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_4'] = this.step4;
    data['Country'] = this.country;
    data['address_type'] = this.addressType;
    data['permanent_house_type'] = this.permanentHouseType;
    data['permanent_state'] = this.permanentState;
    data['permanent_city'] = this.permanentCity;
    data['permanent_pincode'] = this.permanentPincode;
    data['temp_state'] = this.tempState;
    data['temp_city'] = this.tempCity;
    data['temp_pincode'] = this.tempPincode;
    data['reference1_reletion'] = this.reference1Reletion;
    data['reference1_name'] = this.reference1Name;
    data['reference1_email'] = this.reference1Email;
    data['reference1_mobile'] = this.reference1Mobile;
    data['reference2_reletion'] = this.reference2Reletion;
    data['reference2_name'] = this.reference2Name;
    data['reference2_email'] = this.reference2Email;
    data['reference2_mobile'] = this.reference2Mobile;
    return data;
  }
}
