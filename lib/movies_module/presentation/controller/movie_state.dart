import 'package:equatable/equatable.dart';
import 'package:movie_app/core/util/enum.dart';
import 'package:movie_app/movies_module/domain/entities/movie.dart';

class MovieState extends Equatable{

  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topRateMovie;
  final RequestState topRateState;
  final String topRateMessage;
  
  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage ="",

    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMessage ="",

    this.topRateMovie = const [],
    this.topRateState = RequestState.loading,
    this.topRateMessage ="",

    });
    MovieState copyWith({
   List<Movie>? nowPlayingMovie,
   RequestState? nowPlayingState,
   String? nowPlayingMessage,

   List<Movie>? popularMovie,
   RequestState? popularState,
   String? popularMessage,

   List<Movie>? topRateMovie,
   RequestState? topRateState,
   String? topRateMessage,
    }) {
return MovieState(
nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie ,
nowPlayingState: nowPlayingState ?? this.nowPlayingState ,
nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

popularMovie: popularMovie ?? this.popularMovie ,
popularState: popularState ?? this.popularState ,
popularMessage: popularMessage ?? this.popularMessage,

topRateMovie: topRateMovie ?? this.topRateMovie ,
topRateState: topRateState ?? this.topRateState ,
topRateMessage: topRateMessage ?? this.topRateMessage,
);
    }
    
      @override
      List<Object?> get props => [
        nowPlayingMovie , 
        nowPlayingState , 
        nowPlayingMessage,

        popularMovie,
        popularState,
        popularMessage,

        topRateMovie,
        topRateState,
        topRateMessage,
        ];
}