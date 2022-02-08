class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isVerified;

  UserModel({this.name, this.email, this.phone, this.uId, this.isVerified});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    isVerified = json['isVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isVerified': isVerified,
    };
  }
}
