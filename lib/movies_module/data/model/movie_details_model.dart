import 'package:movie_app/movies_module/data/model/geners_model.dart';
import 'package:movie_app/movies_module/domain/entities/movie_detials.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage});

    factory MovieDetailsModel.fromJson(Map<String , dynamic> json) =>
    MovieDetailsModel(
      genres: List<GenersModel>.from
      (json["genres"].map((x) => GenersModel.fromJson(x))),
      backdropPath:json["backdrop_path"],
      id: json["id"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      runtime: json["runtime"],
      title: json["title"],
      voteAverage: json ["vote_average"].toDouble(),
      );
  
}