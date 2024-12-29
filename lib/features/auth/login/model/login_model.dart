class LoginModel {
  Data? data;
  String? message;
  bool? status;

  LoginModel({this.data, this.message, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? bio;
  String? email;
  String? country;
  String? countryName;
  int? age;
  String? gender;
  String? tribe;
  String? lineage;
  String? nationality;
  String? nationalityName;
  String? maritalStatus;
  String? jobTitle;
  String? birthDate;
  String? doctrine;
  String? skinColor;
  double? weight;
  double? height;
  String? bodyShape;
  bool? smoker;
  List<String>? values;
  String? healthState;
  String? religion;
  String? hijab;
  String? personalityTest;
  String? education;
  String? financial;
  String? hobbies;
  String? images;
  String? image;
  bool? verified;
  bool? hasPackage;
  String? yourSpecifications;
  String? yourMateSpecifications;
  int? verificationCodeForTest;
  bool? isApple;

  User({
    this.id,
    this.name,
    this.bio,
    this.email,
    this.country,
    this.countryName,
    this.age,
    this.gender,
    this.tribe,
    this.lineage,
    this.nationality,
    this.nationalityName,
    this.maritalStatus,
    this.jobTitle,
    this.birthDate,
    this.doctrine,
    this.skinColor,
    this.weight,
    this.height,
    this.bodyShape,
    this.smoker,
    this.values,
    this.healthState,
    this.religion,
    this.hijab,
    this.personalityTest,
    this.education,
    this.financial,
    this.hobbies,
    this.images,
    this.image,
    this.verified,
    this.hasPackage,
    this.yourSpecifications,
    this.yourMateSpecifications,
    this.verificationCodeForTest,
    this.isApple,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    email = json['email'];
    country = json['country'];
    countryName = json['country_name'];
    age = json['age'];
    gender = json['gender'];
    tribe = json['tribe'];
    lineage = json['lineage'];
    nationality = json['nationality'];
    nationalityName = json['nationality_name'];
    maritalStatus = json['marital_status'];
    jobTitle = json['job_title'];
    birthDate = json['birth_date'];
    doctrine = json['doctrine'];
    skinColor = json['skin_color'];
    weight = json['weight']?.toDouble();
    height = json['height']?.toDouble();
    bodyShape = json['body_shape'];
    smoker = json['smoker'];
    values = json['values']?.cast<String>();
    healthState = json['health_state'];
    religion = json['religion'];
    hijab = json['hijab'];
    personalityTest = json['personality_test'];
    education = json['education'];
    financial = json['financial'];
    hobbies = json['hobbies'];
    images = json['images'];
    image = json['image'];
    verified = json['verified'];
    hasPackage = json['has_package'];
    yourSpecifications = json['your_specifications'];
    yourMateSpecifications = json['your_mate_specifications'];
    verificationCodeForTest = json['verification_code_for_test'];
    isApple = json['is_apple'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['email'] = this.email;
    data['country'] = this.country;
    data['country_name'] = this.countryName;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['tribe'] = this.tribe;
    data['lineage'] = this.lineage;
    data['nationality'] = this.nationality;
    data['nationality_name'] = this.nationalityName;
    data['marital_status'] = this.maritalStatus;
    data['job_title'] = this.jobTitle;
    data['birth_date'] = this.birthDate;
    data['doctrine'] = this.doctrine;
    data['skin_color'] = this.skinColor;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['body_shape'] = this.bodyShape;
    data['smoker'] = this.smoker;
    if (this.values != null) {
      data['values'] = this.values;
    }
    data['health_state'] = this.healthState;
    data['religion'] = this.religion;
    data['hijab'] = this.hijab;
    data['personality_test'] = this.personalityTest;
    data['education'] = this.education;
    data['financial'] = this.financial;
    data['hobbies'] = this.hobbies;
    data['images'] = this.images;
    data['image'] = this.image;
    data['verified'] = this.verified;
    data['has_package'] = this.hasPackage;
    data['your_specifications'] = this.yourSpecifications;
    data['your_mate_specifications'] = this.yourMateSpecifications;
    data['verification_code_for_test'] = this.verificationCodeForTest;
    data['is_apple'] = this.isApple;
    return data;
  }
}
