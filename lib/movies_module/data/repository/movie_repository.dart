import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/excaption.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies_module/data/dataSource/remote_movie_data_source.dart';
import 'package:movie_app/movies_module/domain/entities/movie.dart';
import 'package:movie_app/movies_module/domain/entities/movie_detials.dart';
import 'package:movie_app/movies_module/domain/entities/recommendation.dart';
import 'package:movie_app/movies_module/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies_module/domain/usecase/get_movie_detials_usecase.dart';
import 'package:movie_app/movies_module/domain/usecase/get_recommendation_usecase.dart';

class MovieRepository extends BaseMovieRepository{

final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MovieRepository(this.baseRemoteMovieDataSource);  
  
  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async{
    final result =await baseRemoteMovieDataSource.getNowPlayingMovie();
    try{

return Right(result);

    }on ServerException catch (failure){
     
 return left(Serverfailure(failure.errorMessageModle.statusMessage));
  
  }
  }
  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async{
   final result =await baseRemoteMovieDataSource.getPopularMovie();
    try{

return Right(result);

    }on ServerException catch (failure){
     
 return left(Serverfailure(failure.errorMessageModle.statusMessage));
  
  }}

  @override
  Future<Either<Failure,List<Movie>>> getTopRateMovies() async {
final result =await baseRemoteMovieDataSource.getToRatedMovie();
    try{

return Right(result);

    }on ServerException catch (failure){
     
 return left(Serverfailure(failure.errorMessageModle.statusMessage));
  
  }  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result =await baseRemoteMovieDataSource.getMovieDetials(parameters);
    try{

return Right(result);

    }on ServerException catch (failure){
     
 return left(Serverfailure(failure.errorMessageModle.statusMessage));
  
  } 
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
     final result =await baseRemoteMovieDataSource.getRecommendation(parameters);
    try{

return Right(result);

    }on ServerException catch (failure){
     
 return left(Serverfailure(failure.errorMessageModle.statusMessage));
  
  } 
  }
  
  
}