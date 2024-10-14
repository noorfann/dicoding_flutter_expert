import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_now_playing_movies.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  GetNowPlayingMovies _getNowPlayingMovies;
  NowPlayingMoviesBloc(this._getNowPlayingMovies)
      : super(GetNowPlayingMoviesEmpty()) {
    on<OnGetNowPlayingMovies>((event, emit) async {
      emit(GetNowPlayingMoviesLoading());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
        (failure) {
          emit(GetNowPlayingMoviesError(failure.message));
        },
        (data) {
          emit(GetNowPlayingMoviesHasData(data));
        },
      );
    });
  }
}
