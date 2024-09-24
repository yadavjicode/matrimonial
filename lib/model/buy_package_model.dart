class BuyPackageModel {
  String? status;
  String? title;
  String? message;

  BuyPackageModel({this.status, this.title, this.message});

  BuyPackageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['title'] = this.title;
    data['message'] = this.message;
    return data;
  }
}
