import 'package:movie_app/movies_module/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation{
  const RecommendationModel({
    super.backdropPath,
    required super.id});

factory RecommendationModel.fromJson(Map<String , dynamic> json) =>
RecommendationModel(
  backdropPath:json["backdrop_path"] ?? "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
  id:json ["id"]
  );
}