class ShortlistModel {
  String? status;
  String? message;
  String? title;
  int? code;

  ShortlistModel({this.status, this.message, this.title, this.code});

  ShortlistModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    title = json['title'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['title'] = this.title;
    data['code'] = this.code;
    return data;
  }
}
