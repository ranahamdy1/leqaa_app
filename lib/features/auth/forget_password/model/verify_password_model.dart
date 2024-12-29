class VerifyPasswordModel {
  Data? data;
  String? message;
  bool? status;

  VerifyPasswordModel({this.data, this.message, this.status});

  VerifyPasswordModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() => {
    if (data != null) 'data': data!.toJson(),
    'message': message,
    'status': status,
  };
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() => {
    if (user != null) 'user': user!.toJson(),
  };
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
  String? weight;
  String? height;
  String? bodyShape;
  String? smoker;
  List<String>? values;
  String? healthState;
  String? religion;
  String? hijab;
  String? personalityTest;
  String? education;
  String? financial;
  String? hobbies;
  List<String>? images;
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
    weight = json['weight'];
    height = json['height'];
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
    images = json['images']?.cast<String>();
    image = json['image'];
    verified = json['verified'];
    hasPackage = json['has_package'];
    yourSpecifications = json['your_specifications'];
    yourMateSpecifications = json['your_mate_specifications'];
    verificationCodeForTest = json['verification_code_for_test'];
    isApple = json['is_apple'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'bio': bio,
    'email': email,
    'country': country,
    'country_name': countryName,
    'age': age,
    'gender': gender,
    'tribe': tribe,
    'lineage': lineage,
    'nationality': nationality,
    'nationality_name': nationalityName,
    'marital_status': maritalStatus,
    'job_title': jobTitle,
    'birth_date': birthDate,
    'doctrine': doctrine,
    'skin_color': skinColor,
    'weight': weight,
    'height': height,
    'body_shape': bodyShape,
    'smoker': smoker,
    'values': values,
    'health_state': healthState,
    'religion': religion,
    'hijab': hijab,
    'personality_test': personalityTest,
    'education': education,
    'financial': financial,
    'hobbies': hobbies,
    'images': images,
    'image': image,
    'verified': verified,
    'has_package': hasPackage,
    'your_specifications': yourSpecifications,
    'your_mate_specifications': yourMateSpecifications,
    'verification_code_for_test': verificationCodeForTest,
    'is_apple': isApple,
  };
}
