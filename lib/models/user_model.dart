class UserModel {
  String? name;
  String? phone;
  String? profileImage;
  String? uId;

  UserModel({this.name, this.phone, this.profileImage, this.uId});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    profileImage = json['profileImage'];
    uId = json['uId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'profileImage': profileImage,
      'uId': uId,
    };
  }
}