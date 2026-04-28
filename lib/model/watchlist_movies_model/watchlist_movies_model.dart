class WatchlistMoviesModel {
  String? id;
  String? title;
  String? image;
  double? rating;

  WatchlistMoviesModel({
    this.id,
    this.title,
    this.image,
    this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'rating': rating,
    };
  }
  WatchlistMoviesModel.fromJson(Map<String, dynamic> json, String docId) {
    id = docId;
    title = json['title'];
    image = json['image'];

    rating = json['rating'] != null
        ? (json['rating'] as num).toDouble()
        : null;
  }
}