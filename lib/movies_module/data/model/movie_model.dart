import 'package:movie_app/movies_module/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate});

    factory MovieModel.fromJson(Map< String , dynamic> json)=>MovieModel(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      genreIds: List<int>.from(json["genre_ids"].map((e)=>e)),
      overview: json["overview"],
      releaseDate: json["release_date"],
      title: json["title"],

      // TODo : CHECK THIS
      voteAverage: json["vote_average"].toDouble()

    );


}