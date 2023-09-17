import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movie_app/core/base_usecase/base_usecase.dart';
import 'package:movie_app/core/util/enum.dart';
import 'package:movie_app/movies_module/domain/usecase/get_nowplaying_usecase.dart';
import 'package:movie_app/movies_module/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movie_app/movies_module/domain/usecase/get_toprate_movie_usecase.dart';
import 'package:movie_app/movies_module/presentation/controller/movie_event.dart';
import 'package:movie_app/movies_module/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent , MovieState> {
 final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
 final GetPopularMovieUsecase getPopularMovieUsecase;
 final GetTopRateMovieUsecase getTopRateMovieUsecase;
 
  MovieBloc(this.getNowPlayingMovieUsecase, this.getPopularMovieUsecase, this.getTopRateMovieUsecase) 
  : super(const MovieState()){
  
  on<GetNowPlayingMovieEvent>(_getNowPlayingMovie);
  on<GetPopularMovieEvent>(_getPopularMovie);
  on<GetTopRateMovieEvent>(_getTopRateMovie);
}

  
  FutureOr<void> _getNowPlayingMovie(GetNowPlayingMovieEvent event, Emitter<MovieState> emit) async{ 

    final result = await getNowPlayingMovieUsecase.call(const NoParameter());
  result.fold(
    (l) =>emit(
      
      state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage:  l.message,
      
      )),
    
    (r) =>emit(
      
      state.copyWith(
        nowPlayingMovie: r,
        nowPlayingState: RequestState.loaded,
      
      )));
  }

  FutureOr<void> _getPopularMovie(GetPopularMovieEvent event, Emitter<MovieState> emit)async {
    final result = await getPopularMovieUsecase.call(const NoParameter());

  result.fold(
    (l) =>emit(
      
      state.copyWith(
        popularState: RequestState.error , 
        popularMessage: l.message,
      )),
    
    (r) =>emit(
      
      state.copyWith(
        popularMovie: r ,
        popularState: RequestState.loaded,
      
      )
      )
      );
  }

  FutureOr<void> _getTopRateMovie(GetTopRateMovieEvent event, Emitter<MovieState> emit)async{
    final result =await getTopRateMovieUsecase.call(const NoParameter());

    result.fold((l) => emit(state.copyWith(
      topRateState: RequestState.error,
      topRateMessage: l.message,
    ))
    
    , (r) => emit(
      state.copyWith(
        topRateMovie: r,
        topRateState: RequestState.loaded,
      )
    ));

  }
}

  
