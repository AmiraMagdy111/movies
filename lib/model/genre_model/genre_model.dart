class GenreModel {
  final String name;

  GenreModel(this.name);

  static List<GenreModel> genres = [
    GenreModel("Action"),
    GenreModel("Horror"),
    GenreModel("Biography"),
    GenreModel("Drama"),
    GenreModel("Thriller"),
    GenreModel("Comedy"),
  ];
}