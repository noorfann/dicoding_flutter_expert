import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:ditonton/data/datasources/watchlist_local_data_source.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/movies/search_movies.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/search_tv_series.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  DatabaseHelper,
  TVSeriesRepository,
  TVSeriesRemoteDataSource,
  WatchlistRepository,
  WatchlistLocalDataSource,
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
  SearchMovies,
  GetAiringTodayTVSeries,
  GetPopularTVSeries,
  GetTopRatedTVSeries,
  SearchTVSeries
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
