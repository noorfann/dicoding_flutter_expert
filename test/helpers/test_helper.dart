import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/movie/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/tv_series/tv_series_remote_data_source.dart';
import 'package:ditonton/data/datasources/watchlist_local_data_source.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  DatabaseHelper,
  TVSeriesRepository,
  TVSeriesRemoteDataSource,
  WatchlistRepository,
  WatchlistLocalDataSource
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
