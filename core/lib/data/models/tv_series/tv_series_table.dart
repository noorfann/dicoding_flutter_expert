import 'package:core/common/watch_category_enum.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TVSeriesTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;

  TVSeriesTable({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory TVSeriesTable.fromEntity(TVSeriesDetail tvSeries) => TVSeriesTable(
        id: tvSeries.id,
        title: tvSeries.originalName,
        posterPath: tvSeries.posterPath,
        overview: tvSeries.overview,
      );

  factory TVSeriesTable.fromMap(Map<String, dynamic> map) => TVSeriesTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'category': WatchCategory.tvSeries.code
      };

  TVSeries toEntity() => TVSeries.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        originalName: title,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, posterPath, overview];
}
