class SentInvitationModel {
  String? status;
  String? message;
  String? title;
  dynamic key;

  SentInvitationModel({this.status, this.message, this.title, this.key});

  SentInvitationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    title = json['title'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['title'] = this.title;
    data['key'] = this.key;
    return data;
  }
}
