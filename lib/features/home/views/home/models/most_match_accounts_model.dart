class MostMatchAcountModel {
  Data? data;
  String? message;
  bool? status;

  MostMatchAcountModel({this.data, this.message, this.status});

  MostMatchAcountModel.fromJson(Map<String, dynamic> json) {
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
  Null? bestMatch;
  Null? match;
  List<Suggestions>? suggestions;

  Data({this.bestMatch, this.match, this.suggestions});

  Data.fromJson(Map<String, dynamic> json) {
    bestMatch = json['best_match'];
    match = json['match'];
    if (json['suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        suggestions!.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['best_match'] = this.bestMatch;
    data['match'] = this.match;
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  int? id;
  String? image;
  String? name;
  List<Values>? values;
  String? country;
  int? age;
  int? match;

  Suggestions(
      {this.id,
        this.image,
        this.name,
        this.values,
        this.country,
        this.age,
        this.match});

  Suggestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
    country = json['country'];
    age = json['age'];
    match = json['match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    data['country'] = this.country;
    data['age'] = this.age;
    data['match'] = this.match;
    return data;
  }
}

class Values {
  int? id;
  String? title;

  Values({this.id, this.title});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
