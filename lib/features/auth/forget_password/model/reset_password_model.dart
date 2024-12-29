class ResetPasswordModel {
  final Data? data;
  final String? message;
  final bool? status;

  ResetPasswordModel({this.data, this.message, this.status});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    data: json['data'] != null ? Data.fromJson(json['data']) : null,
    message: json['message'],
    status: json['status'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (data != null) map['data'] = data!.toJson();
    if (message != null) map['message'] = message;
    if (status != null) map['status'] = status;
    return map;
  }
}

class Data {
  final User? user;
  final String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json['user'] != null ? User.fromJson(json['user']) : null,
    token: json['token'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (user != null) map['user'] = user!.toJson();
    if (token != null) map['token'] = token;
    return map;
  }
}

class User {
  final int? id;
  final String? name;
  final String? bio;
  final String? email;
  final String? country;
  final String? countryName;
  final int? age;
  final String? gender;
  final String? tribe;
  final String? lineage;
  final String? nationality;
  final String? nationalityName;
  final String? maritalStatus;
  final String? jobTitle;
  final String? birthDate;
  final String? doctrine;
  final String? skinColor;
  final String? weight;
  final String? height;
  final String? bodyShape;
  final String? smoker;
  final List<String>? values;
  final String? healthState;
  final String? religion;
  final String? hijab;
  final String? personalityTest;
  final String? education;
  final String? financial;
  final String? hobbies; // Fixed typo from "hoppies"
  final List<String>? images;
  final String? image;
  final bool? verified;
  final bool? hasPackage;
  final String? yourSpecifications;
  final String? yourMateSpecifications;
  final String? verificationCodeForTest;
  final bool? isApple;

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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    bio: json['bio'],
    email: json['email'],
    country: json['country'],
    countryName: json['country_name'],
    age: json['age'],
    gender: json['gender'],
    tribe: json['tribe'],
    lineage: json['lineage'],
    nationality: json['nationality'],
    nationalityName: json['nationality_name'],
    maritalStatus: json['marital_status'],
    jobTitle: json['job_title'],
    birthDate: json['birth_date'],
    doctrine: json['doctrine'],
    skinColor: json['skin_color'],
    weight: json['weight'],
    height: json['height'],
    bodyShape: json['body_shape'],
    smoker: json['smoker'],
    values: (json['values'] as List?)?.cast<String>(),
    healthState: json['health_state'],
    religion: json['religion'],
    hijab: json['hijab'],
    personalityTest: json['personality_test'],
    education: json['education'],
    financial: json['financial'],
    hobbies: json['hobbies'],
    images: (json['images'] as List?)?.cast<String>(),
    image: json['image'],
    verified: json['verified'],
    hasPackage: json['has_package'],
    yourSpecifications: json['your_specifications'],
    yourMateSpecifications: json['your_mate_specifications'],
    verificationCodeForTest: json['verification_code_for_test'],
    isApple: json['is_apple'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    if (id != null) map['id'] = id;
    if (name != null) map['name'] = name;
    if (bio != null) map['bio'] = bio;
    // Add other fields similarly
    return map;
  }
}
