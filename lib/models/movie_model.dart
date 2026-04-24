class MovieModel {
  final String movieId;
  final String name;
  final num rating;
  final String imageURL;
  final String year;
  MovieModel({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      movieId: json['movieId']?.toString() ?? '',
      name: json['name'] ?? 'Unknown',
      rating: (json['rating'] ?? 0.0),
      imageURL: json['imageURL'] ?? '',
      year: json['year'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'name': name,
      'rating': rating,
      'imageURL': imageURL,
      'year': year,
    };
  }
}