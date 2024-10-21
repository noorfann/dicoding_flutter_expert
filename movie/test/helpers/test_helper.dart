import 'dart:io';

import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/movie/movie_remote_data_source.dart';
import 'package:core/data/datasources/watchlist_local_data_source.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/watchlist_repository.dart';
import 'package:core/domain/usecases/movies/get_movie_detail.dart';
import 'package:core/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:core/domain/usecases/movies/get_popular_movies.dart';
import 'package:core/domain/usecases/movies/get_top_rated_movies.dart';
import 'package:core/domain/usecases/movies/search_movies.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  DatabaseHelper,
  WatchlistRepository,
  WatchlistLocalDataSource,
  GetNowPlayingMovies,
  GetPopularMovies,
  GetTopRatedMovies,
  SearchMovies,
  GetMovieDetail,
], customMocks: [
  MockSpec<HttpClient>(as: #MockHttpClient),
])
void main() {}
