import 'dart:io';

import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:ditonton/data/datasources/watchlist_local_data_source.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:ditonton/domain/usecases/movies/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/movies/search_movies.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/search_tv_series.dart';
import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';

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
  GetMovieDetail,
  GetAiringTodayTVSeries,
  GetPopularTVSeries,
  GetTopRatedTVSeries,
  SearchTVSeries,
  GetTVSeriesDetail
], customMocks: [
  MockSpec<HttpClient>(as: #MockHttpClient),
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
