class AppRulesModel {
  Data? data;
  String? message;
  bool? status;

  AppRulesModel({this.data, this.message, this.status});

  AppRulesModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? termsConditions;

  Data({this.termsConditions});

  Data.fromJson(Map<String, dynamic> json) {
    termsConditions = json['terms_conditions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['terms_conditions'] = this.termsConditions;
    return data;
  }
}
