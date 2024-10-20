import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:ditonton/data/datasources/watchlist_local_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tv_series_repository_impl.dart';
import 'package:ditonton/data/repositories/watchlist_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:ditonton/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/search_tv_series.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/watchlist/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/watchlist/save_watchlist_movie.dart';
import 'package:ditonton/domain/usecases/movies/search_movies.dart';
import 'package:ditonton/domain/usecases/watchlist/save_watchlist_tv_series.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/movie_recommendation_bloc/movie_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/movie_search_bloc/movie_search_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/movie_watchlist_bloc/movie_watchlist_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing_movies_bloc/now_playing_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_bloc/now_playing_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/popular_tv_series_bloc/popular_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/top_rated_tv_series_bloc/top_rated_tv_series_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail/tv_series_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_recommendation_bloc/tv_series_recommendation_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_search_bloc/tv_series_search_bloc.dart';
import 'package:ditonton/presentation/bloc/watchlist/watchlist_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'presentation/bloc/tv_series/tv_series_watchlist_bloc/tv_series_watchlist_bloc.dart';

final locator = GetIt.instance;

void init() {
  //movie bloc
  locator.registerFactory(
    () => PopularMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieRecommendationBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieWatchlistBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  // tv series bloc
  locator.registerFactory(
    () => PopularTVSeriesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTVSeriesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => NowPlayingTVSeriesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TVSeriesDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesRecommendationBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvSeriesWatchlistBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  // watchlist bloc
  locator.registerFactory(
    () => WatchlistBloc(
      locator(),
      locator(),
    ),
  );

  // use case - movie
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));

  // use case - watchlist
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));

  // use case - tv series
  locator.registerLazySingleton(() => GetAiringTodayTVSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTVSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTVSeries(locator()));
  locator.registerLazySingleton(() => GetTVSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTVSeriesRecommendation(locator()));
  locator.registerLazySingleton(() => SearchTVSeries(locator()));

  // use case - watchlist

  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(
    () => GetWatchlistTvSeries(locator()),
  );

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TVSeriesRepository>(
    () => TVSeriesRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<WatchlistRepository>(
    () => WatchlistRepositoryImpl(
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TVSeriesRemoteDataSource>(
      () => TVSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<WatchlistLocalDataSource>(
      () => WatchlistLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => http.Client());
}
