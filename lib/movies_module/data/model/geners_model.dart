
import 'package:movie_app/movies_module/domain/entities/genres.dart';

class GenersModel extends Genres {
  const GenersModel({
    required super.id,
    required super.name});

  factory GenersModel.fromJson(Map<String , dynamic> json) =>
  GenersModel(id:json ["id"], name:json ["name"]);
}