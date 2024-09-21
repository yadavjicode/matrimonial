class SentInvitationModel {
  String? status;
  String? message;
  String? title;

  SentInvitationModel({this.status, this.message, this.title});

  SentInvitationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['title'] = this.title;
    return data;
  }
}
