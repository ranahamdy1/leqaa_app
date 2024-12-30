class AboutAppModel {
  Data? data;
  String? message;
  bool? status;

  AboutAppModel({this.data, this.message, this.status});

  AboutAppModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? aboutApp;

  Data({this.aboutApp});

  Data.fromJson(Map<String, dynamic> json) {
    aboutApp = json['about_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about_app'] = this.aboutApp;
    return data;
  }
}
