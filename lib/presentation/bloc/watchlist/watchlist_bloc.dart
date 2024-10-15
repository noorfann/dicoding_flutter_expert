import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchlistTvSeries _getWatchlistTvSeries;
  WatchlistBloc(this._getWatchlistMovies, this._getWatchlistTvSeries)
      : super(GetWatchlistEmpty()) {
    on<OnGetWatchlistMovie>((event, emit) async {
      emit(GetWatchlistLoading());
      final result = await _getWatchlistMovies.execute();
      result.fold(
        (failure) {
          emit(GetWatchlistError(failure.message));
        },
        (data) {
          emit(GetWatchlistMovieHasData(data));
        },
      );
    });

    on<OnGetWatchlistTVSeries>((event, emit) async {
      emit(GetWatchlistLoading());
      final result = await _getWatchlistTvSeries.execute();
      result.fold(
        (failure) {
          emit(GetWatchlistError(failure.message));
        },
        (data) {
          emit(GetWatchlistTVSeriesHasData(data));
        },
      );
    });
  }
}
