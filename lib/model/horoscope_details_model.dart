class HoroscopeDetailsModel {
  bool? status;
  Data? data;

  HoroscopeDetailsModel({this.status, this.data});

  HoroscopeDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step11;
  dynamic timeOfBirth;
  dynamic stateOfBirth;
  dynamic cityOfBirth;

  Data({this.step11, this.timeOfBirth, this.stateOfBirth, this.cityOfBirth});

  Data.fromJson(Map<String, dynamic> json) {
    step11 = json['step_11'];
    timeOfBirth = json['time_of_birth'];
    stateOfBirth = json['state_of_birth'];
    cityOfBirth = json['city_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_11'] = this.step11;
    data['time_of_birth'] = this.timeOfBirth;
    data['state_of_birth'] = this.stateOfBirth;
    data['city_of_birth'] = this.cityOfBirth;
    return data;
  }
}
