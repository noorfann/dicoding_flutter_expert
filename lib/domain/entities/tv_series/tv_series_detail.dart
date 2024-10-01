import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv_series/season.dart';
import 'package:equatable/equatable.dart';

class TVSeriesDetail extends Equatable {
  TVSeriesDetail({
    required this.name,
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.episodeRunTime,
    required this.seasons,
  });

  final bool adult;
  final String name;
  final String? backdropPath;
  final List<Genre> genres;
  final List<int> episodeRunTime;
  final int id;
  final String originalName;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final List<Season> seasons;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalName,
        overview,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
