import 'package:core/common/watch_category_enum.dart';
import 'package:core/domain/entities/movie/movie.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class WatchlistTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  WatchlistTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory WatchlistTable.fromMovieEntity(MovieDetail movie) => WatchlistTable(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath,
        overview: movie.overview,
      );

  factory WatchlistTable.fromTVSeriesEntity(TVSeriesDetail tvSeries) =>
      WatchlistTable(
        id: tvSeries.id,
        title: tvSeries.originalName,
        posterPath: tvSeries.posterPath,
        overview: tvSeries.overview,
      );

  factory WatchlistTable.fromMap(Map<String, dynamic> map) => WatchlistTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJsonMovie() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'category': WatchCategory.movie.code
      };

  Map<String, dynamic> toJsonTVSeries() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'category': WatchCategory.tvSeries.code
      };

  Movie toEntityMovie() => Movie.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  TVSeries toEntityTVSeries() => TVSeries.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        originalName: title,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, posterPath, overview];
}
