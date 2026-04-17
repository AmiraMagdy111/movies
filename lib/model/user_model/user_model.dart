class UserModel {
  final String ?id;
  final String? name;
  final String? email;
  final String? phone;
  final String? profileImage;

  UserModel({
    this.id,
     this.name,
    this.email,
     this.phone,
    this.profileImage,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ,
      name: json['name'] ,
      email: json['email'] ,
      phone: json['phone'] ,
      profileImage: json['profileImage'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,

    };
  }
  UserModel copyWith({
    String? name,
    String? phone,
    String? profileImage,
    String? id,
  }) {
    return UserModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      id: id ?? this.id,
    );
  }
}