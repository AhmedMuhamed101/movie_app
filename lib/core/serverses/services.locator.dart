import 'package:get_it/get_it.dart';
import 'package:movie_app/movies_module/data/dataSource/remote_movie_data_source.dart';
import 'package:movie_app/movies_module/data/repository/movie_repository.dart';
import 'package:movie_app/movies_module/domain/usecase/get_nowplaying_usecase.dart';
import 'package:movie_app/movies_module/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movie_app/movies_module/domain/usecase/get_recommendation_usecase.dart';
import 'package:movie_app/movies_module/presentation/controller/movie_bloc.dart';

import '../../movies_module/domain/repository/base_movie_repository.dart';
import '../../movies_module/domain/usecase/get_movie_detials_usecase.dart';
import '../../movies_module/domain/usecase/get_toprate_movie_usecase.dart';
import '../../movies_module/presentation/controller/bloc/movie_details_bloc.dart';

final sl =GetIt.instance;

class ServicesLocator {
  void init(){
///BLOc 

sl.registerLazySingleton(() => MovieBloc(sl() , sl() , sl()));
sl.registerLazySingleton(() => MovieDetailsBloc(sl() , sl()));

///Usecase
sl.registerLazySingleton(() => GetNowPlayingMovieUsecase(sl()));
sl.registerLazySingleton(() => GetPopularMovieUsecase(sl()));
sl.registerLazySingleton(() => GetTopRateMovieUsecase(sl()));
sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));



/// Repository
sl.registerLazySingleton<BaseMovieRepository>(
  () => MovieRepository(sl()));

////Data Sourse
sl.registerLazySingleton<BaseRemoteMovieDataSource>(
  () => RemoteMovieDataSource());

  }
}