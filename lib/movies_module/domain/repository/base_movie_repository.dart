import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies_module/domain/entities/movie.dart';
import 'package:movie_app/movies_module/domain/entities/movie_detials.dart';
import 'package:movie_app/movies_module/domain/usecase/get_movie_detials_usecase.dart';

import '../entities/recommendation.dart';
import '../usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRepository {

Future<Either<Failure,List<Movie>>> getNowPlayingMovies();  

Future<Either<Failure,List<Movie>>> getPopularMovies();  

Future<Either<Failure,List<Movie>>> getTopRateMovies();  

Future<Either<Failure , MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);

Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters);  

}