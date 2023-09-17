import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/util/enum.dart';
import 'package:movie_app/movies_module/domain/entities/movie_detials.dart';
import 'package:movie_app/movies_module/domain/entities/recommendation.dart';
import 'package:movie_app/movies_module/domain/usecase/get_movie_detials_usecase.dart';
import 'package:movie_app/movies_module/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase) : super(
    const MovieDetailsState()){

    on<GetMovieDetailsEvent>(_getMovieDetails);
  
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  
  final GetRecommendationUsecase getRecommendationUsecase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {

    ///CHECK CALL METHOD....
final result = await getMovieDetailsUsecase.call(MovieDetailsParameters(
  movieId: event.id));
            print("build 2 3");
result.fold((l) => 
emit(state.copyWith(
  movieDetailsState: RequestState.error,
  movieDetailsMessage: l.message
)),
 (r) =>emit(state.copyWith(
  movieDetail: r,
  movieDetailsState: RequestState.loaded,
  
 ))
);
}

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{

final result = await getRecommendationUsecase.call(RecommendationParameters(event.id,),);

result.fold((l) => 
emit(state.copyWith(
  recommendationState: RequestState.error,
  recommendationMessage: l.message
)),
 (r) =>emit(state.copyWith(
  recommendation: r,
  recommendationState: RequestState.loaded,
  
 ),),
);

  }
}