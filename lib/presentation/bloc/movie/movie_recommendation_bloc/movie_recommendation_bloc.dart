import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/usecases/movies/get_movie_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'movie_recommendation_event.dart';
part 'movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends Bloc<MovieRecommendationEvent, MovieRecommendationState> {
  GetMovieRecommendations _getMovieRecommendations;
  MovieRecommendationBloc(this._getMovieRecommendations)
      : super(MovieRecommendationEmpty()) {
    on<OnGetMovieRecommendation>((event, emit) async {
      emit(MovieRecommendationLoading());
      final result = await _getMovieRecommendations.execute(event.id);
      result.fold(
        (error) {
          emit(MovieRecommendationError(error.message));
        },
        (data) {
          emit(MovieRecommendationHasData(data));
        },
      );
    });
  }
}
