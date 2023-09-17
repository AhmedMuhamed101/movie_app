import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies_module/domain/entities/movie_detials.dart';
import 'package:movie_app/movies_module/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUsecase extends BaseUseCase<MovieDetails , MovieDetailsParameters > {
final BaseMovieRepository baseMovieRepository ;

  GetMovieDetailsUsecase(this.baseMovieRepository);


  @override
  Future<Either<Failure, MovieDetails>> call( MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
     
     }
  
}

class MovieDetailsParameters extends Equatable {

  final int movieId;

  const MovieDetailsParameters({ required this.movieId});
  
  @override
  List<Object?> get props => [movieId];
  
}