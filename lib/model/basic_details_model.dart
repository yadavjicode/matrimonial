class BasicDetailsModel {
  bool? status;
  Data? data;

  BasicDetailsModel({this.status, this.data});

  BasicDetailsModel.fromJson(Map<String, dynamic> json) {
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
  dynamic step2;
  dynamic nameTitle;
  dynamic name;
  dynamic surename;
  dynamic spiritualName;
  dynamic maritalstatus;
  dynamic height;
  dynamic weight;
  dynamic dOB;
  dynamic hobbies;
  dynamic diet;
  dynamic about;

  Data(
      {this.step2,
      this.nameTitle,
      this.name,
      this.surename,
      this.spiritualName,
      this.maritalstatus,
      this.height,
      this.weight,
      this.dOB,
      this.hobbies,
      this.diet,
      this.about});

  Data.fromJson(Map<String, dynamic> json) {
    step2 = json['step_2'];
    nameTitle = json['name_title'];
    name = json['Name'];
    surename = json['surename'];
    spiritualName = json['spiritual_name'];
    maritalstatus = json['Maritalstatus'];
    height = json['Height'];
    weight = json['Weight'];
    dOB = json['DOB'];
    hobbies = json['Hobbies'];
    diet = json['Diet'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_2'] = this.step2;
    data['name_title'] = this.nameTitle;
    data['Name'] = this.name;
    data['surename'] = this.surename;
    data['spiritual_name'] = this.spiritualName;
    data['Maritalstatus'] = this.maritalstatus;
    data['Height'] = this.height;
    data['Weight'] = this.weight;
    data['DOB'] = this.dOB;
    data['Hobbies'] = this.hobbies;
    data['Diet'] = this.diet;
    data['about'] = this.about;
    return data;
  }
}
