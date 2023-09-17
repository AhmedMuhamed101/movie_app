import 'package:dio/dio.dart';
import 'package:movie_app/core/error/excaption.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/util/app_constance.dart';
import 'package:movie_app/movies_module/data/model/movie_details_model.dart';
import 'package:movie_app/movies_module/data/model/movie_model.dart';
import 'package:movie_app/movies_module/data/model/recommendation_model.dart';
import 'package:movie_app/movies_module/domain/entities/movie.dart';
import 'package:movie_app/movies_module/domain/usecase/get_movie_detials_usecase.dart';
import 'package:movie_app/movies_module/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseRemoteMovieDataSource {
  
Future<List<MovieModel>> getNowPlayingMovie();

Future <List<Movie>> getPopularMovie();

Future <List<Movie>> getToRatedMovie();

Future<MovieDetailsModel> getMovieDetials(MovieDetailsParameters parameters);

Future <List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);

}


class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  @override
Future<List<MovieModel>> getNowPlayingMovie()async{
  final  response = await Dio().get(
      AppConstace.nowPlayingMoviePath);

    if(response.statusCode==200){
      return List< MovieModel >.from(( response.data[ "results" ] as List ).map((e) => MovieModel.fromJson(e),));
    
  }else{
      throw ServerException(errorMessageModle:
       ErrorMessageModle.fromJson(response.data));
   }  
  }



  @override
Future<List<MovieModel>> getPopularMovie() async {
     
 final response= await Dio().get(AppConstace.popularMoviePath);

 if(response.statusCode==200){

  return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromJson(e),));
 }else{
  throw ServerException(errorMessageModle:  ErrorMessageModle.fromJson(response.data));
 }
  }
  


  @override
Future<List<Movie>> getToRatedMovie() async{
   final  response = await Dio().get(
      AppConstace.toRatedMoviePath);

    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) => MovieModel.fromJson(e),));
    
  }else{
      throw ServerException(errorMessageModle:
       ErrorMessageModle.fromJson(response.data));
   }  
  }
  
  @override
 
 
  Future<MovieDetailsModel> getMovieDetials (MovieDetailsParameters parameters )async{
   final  response = await Dio().get(
      AppConstace.movieDetailsPath(parameters.movieId));

    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
  }else{
      throw ServerException(errorMessageModle:
       ErrorMessageModle.fromJson(response.data));
   }  
  }
  
  @override
 
 
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async{
    final  response = await Dio().get(
      AppConstace.recommendationPath(parameters.id));

    if(response.statusCode==200){
      return List<RecommendationModel>.from((response.data["results"] as List).map((e) => RecommendationModel.fromJson(e),));
    
  }else{
      throw ServerException(errorMessageModle:
       ErrorMessageModle.fromJson(response.data));
   }  
  }
}