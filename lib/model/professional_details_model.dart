class ProfessionalDetailsModel {
  bool? status;
  Data? data;

  ProfessionalDetailsModel({this.status, this.data});

  ProfessionalDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step6;
  dynamic occupation;
  dynamic workingAnywhere;
  dynamic employedin;
  dynamic workState;
  dynamic workCity;
  dynamic workPincode;
  dynamic annualincome;

  Data(
      {this.step6,
      this.occupation,
      this.workingAnywhere,
      this.employedin,
      this.workState,
      this.workCity,
      this.workPincode,
      this.annualincome});

  Data.fromJson(Map<String, dynamic> json) {
    step6 = json['step_6'];
    occupation = json['Occupation'];
    workingAnywhere = json['working_anywhere'];
    employedin = json['Employedin'];
    workState = json['work_state'];
    workCity = json['work_city'];
    workPincode = json['work_pincode'];
    annualincome = json['Annualincome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_6'] = this.step6;
    data['Occupation'] = this.occupation;
    data['working_anywhere'] = this.workingAnywhere;
    data['Employedin'] = this.employedin;
    data['work_state'] = this.workState;
    data['work_city'] = this.workCity;
    data['work_pincode'] = this.workPincode;
    data['Annualincome'] = this.annualincome;
    return data;
  }
}
