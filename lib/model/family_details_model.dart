class FamilyDetailsModel {
  bool? status;
  Data? data;

  FamilyDetailsModel({this.status, this.data});

  FamilyDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step9;
  dynamic religion;
  dynamic caste;
  dynamic subcaste;
  dynamic gothram;
  dynamic language;
  dynamic pEMotherTongue;
  dynamic fatherlivingstatus;
  dynamic fathername;
  dynamic fathersoccupation;
  dynamic fatherBussness;
  dynamic fatherAnnualIncome;
  dynamic motherlivingstatus;
  dynamic mothersname;
  dynamic mothersoccupation;
  dynamic motherAnnualIncome;
  dynamic sister;
  dynamic noofsisters;
  dynamic brother;
  dynamic noofbrothers;
  dynamic familyType;
  dynamic familyvalues;
  dynamic familyStatus;

  Data(
      {this.step9,
      this.religion,
      this.caste,
      this.subcaste,
      this.gothram,
      this.language,
      this.pEMotherTongue,
      this.fatherlivingstatus,
      this.fathername,
      this.fathersoccupation,
      this.fatherBussness,
      this.fatherAnnualIncome,
      this.motherlivingstatus,
      this.mothersname,
      this.mothersoccupation,
      this.motherAnnualIncome,
      this.sister,
      this.noofsisters,
      this.brother,
      this.noofbrothers,
      this.familyType,
      this.familyvalues,
      this.familyStatus});

  Data.fromJson(Map<String, dynamic> json) {
    step9 = json['step_9'];
    religion = json['Religion'];
    caste = json['Caste'];
    subcaste = json['Subcaste'];
    gothram = json['Gothram'];
    language = json['Language'];
    pEMotherTongue = json['PE_MotherTongue'];
    fatherlivingstatus = json['Fatherlivingstatus'];
    fathername = json['Fathername'];
    fathersoccupation = json['Fathersoccupation'];
    fatherBussness = json['father_bussness'];
    fatherAnnualIncome = json['father_annual_income'];
    motherlivingstatus = json['Motherlivingstatus'];
    mothersname = json['Mothersname'];
    mothersoccupation = json['Mothersoccupation'];
    motherAnnualIncome = json['mother_annual_income'];
    sister = json['sister'];
    noofsisters = json['noofsisters'];
    brother = json['brother'];
    noofbrothers = json['noofbrothers'];
    familyType = json['FamilyType'];
    familyvalues = json['Familyvalues'];
    familyStatus = json['FamilyStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_9'] = this.step9;
    data['Religion'] = this.religion;
    data['Caste'] = this.caste;
    data['Subcaste'] = this.subcaste;
    data['Gothram'] = this.gothram;
    data['Language'] = this.language;
    data['PE_MotherTongue'] = this.pEMotherTongue;
    data['Fatherlivingstatus'] = this.fatherlivingstatus;
    data['Fathername'] = this.fathername;
    data['Fathersoccupation'] = this.fathersoccupation;
    data['father_bussness'] = this.fatherBussness;
    data['father_annual_income'] = this.fatherAnnualIncome;
    data['Motherlivingstatus'] = this.motherlivingstatus;
    data['Mothersname'] = this.mothersname;
    data['Mothersoccupation'] = this.mothersoccupation;
    data['mother_annual_income'] = this.motherAnnualIncome;
    data['sister'] = this.sister;
    data['noofsisters'] = this.noofsisters;
    data['brother'] = this.brother;
    data['noofbrothers'] = this.noofbrothers;
    data['FamilyType'] = this.familyType;
    data['Familyvalues'] = this.familyvalues;
    data['FamilyStatus'] = this.familyStatus;
    return data;
  }
}
