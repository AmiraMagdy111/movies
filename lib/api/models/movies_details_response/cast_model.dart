class CastModel {
  final String name;
  final String characterName;
  final String imageUrl;

  CastModel({
    required this.name,
    required this.characterName,
    required this.imageUrl,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'] ?? "",
      characterName: json['character_name'] ?? "",
      imageUrl: json['url_small_image'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "character_name": characterName,
      "url_small_image": imageUrl,
    };
  }
}
