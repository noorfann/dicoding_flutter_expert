import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_tv_series.dart';
import 'package:flutter/foundation.dart';

class WatchlistNotifier extends ChangeNotifier {
  var _watchlistMovies = <Movie>[];
  List<Movie> get watchlistMovies => _watchlistMovies;

  var _watchlistMovieState = RequestState.Empty;
  RequestState get watchlistMovieState => _watchlistMovieState;

  String _messageMovie = '';
  String get messageMovie => _messageMovie;

  var _watchlistTvSeries = <TVSeries>[];
  List<TVSeries> get watchlistTvSeries => _watchlistTvSeries;

  var _watchlistTvSeriesState = RequestState.Empty;
  RequestState get watchlistTvSeriesState => _watchlistTvSeriesState;

  String _messageTvSeries = '';
  String get messageTvSeries => _messageTvSeries;

  WatchlistNotifier(
      {required this.getWatchlistMovies, required this.getWatchlistTvSeries});

  final GetWatchlistMovies getWatchlistMovies;
  final GetWatchlistTvSeries getWatchlistTvSeries;

  Future<void> fetchWatchlistMovies() async {
    _watchlistMovieState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) {
        _watchlistMovieState = RequestState.Error;
        _messageMovie = failure.message;
        notifyListeners();
      },
      (moviesData) {
        if (moviesData.isEmpty) {
          _watchlistMovieState = RequestState.Empty;
          _messageMovie = 'Watchlist is empty';
          notifyListeners();
        } else {
          _watchlistMovieState = RequestState.Loaded;
          _watchlistMovies = moviesData;
          notifyListeners();
        }
      },
    );
  }

  Future<void> fetchWatchlistTVSeries() async {
    _watchlistTvSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvSeries.execute();
    result.fold(
      (failure) {
        _watchlistTvSeriesState = RequestState.Error;
        _messageTvSeries = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        if (tvSeriesData.isEmpty) {
          _watchlistTvSeriesState = RequestState.Empty;
          _messageTvSeries = 'Watchlist is empty';
          notifyListeners();
        } else {
          _watchlistTvSeriesState = RequestState.Loaded;
          _watchlistTvSeries = tvSeriesData;
          notifyListeners();
        }
      },
    );
  }
}
