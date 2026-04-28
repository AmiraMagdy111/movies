import 'package:movies/api/models/movies_response/Movies.dart';
class Data {
  Data({
      this.movie,});
  Data.fromJson(dynamic json) {
    movie = json['movie'] != null ?  Movies.fromJson(json['movie']) : null;
  }
  Movies? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }

}