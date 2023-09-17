 import 'package:dartz/dartz.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies_module/domain/entities/movie.dart';
import 'package:movie_app/movies_module/domain/repository/base_movie_repository.dart';

class GetTopRateMovieUsecase extends BaseUseCase<List<Movie> , NoParameter> {
   final BaseMovieRepository baseMovieRepository;

  GetTopRateMovieUsecase(this.baseMovieRepository);
  
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameters) async {

    return await baseMovieRepository.getTopRateMovies();

  }
  



 }